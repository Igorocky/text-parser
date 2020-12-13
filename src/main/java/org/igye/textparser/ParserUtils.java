package org.igye.textparser;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.tuple.Pair;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static org.igye.textparser.Parsers.stream;

public class ParserUtils {

    public static <P, S extends TokenStream, R> Pair<Preprocessed,List<Object>> parse(
            InputStream inputStream,
            ParserConfig<P, S, R> parserConfig) {
        final Preprocessed preprocessed = preprocess(inputStream, parserConfig);
        final ArrayList<Object> statements = new ArrayList<>();
        stream(
                parserConfig.getStatementParser(),
                () -> ((S)new SimpleTokenStreamImpl(new StringsTokenGenerator(
                        preprocessed.getCode().stream()
                                .map(code -> parserConfig.getCodeToPositionAndText().apply(code))
                                .collect(Collectors.toList())
                )))
        ).forEach(partParseResult -> {
            if (partParseResult.isSuccess()) {
                statements.add(partParseResult.get());
            } else {
                final PositionInText position = (PositionInText) partParseResult.getRemainingTokens().head().position();
                throw new ParserException("Parse error: " + partParseResult.getFailureReason()
                        + " at line=" + position.getLine() + ", col=" + position.getCol());
            }
        });
        return Pair.of(preprocessed,statements);
    }


    public static <P, S extends TokenStream, R> Preprocessed preprocess(
            InputStream inputStream,
            ParserConfig<P, S, R> parserConfig) {
        final Preprocessed preprocessed = new Preprocessed();
        final Object[] prevPart = {null};
        final BiConsumer<Object, Object> setPrecedingComment = parserConfig.getSetPrecedingComment();
        stream(
                parserConfig.getPreprocessParser(),
                () -> ((S)TextParsers.inputStreamToTokenStream(inputStream))
        ).forEach(partParseResult -> {
            if (partParseResult.isFailure()) {
                throw new ParserException("Preprocess error: " + partParseResult.getFailureReason());
            }
            Object part = partParseResult.get();
            if (parserConfig.getIsCode().test(part)) {
                if (setPrecedingComment != null && prevPart[0] != null && !parserConfig.getIsCode().test(prevPart[0])) {
                    setPrecedingComment.accept(part, prevPart[0]);
                }
                preprocessed.getCode().add(part);
            } else {
                preprocessed.getComments().add(part);
            }
            prevPart[0] = part;
        });
        return preprocessed;
    }

    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    @Data
    public static class ParserConfig<P, S extends TokenStream, R> {
        private Parser<S, R, P> preprocessParser;
        private Predicate<Object> isCode;
        private BiConsumer<Object,Object> setPrecedingComment;
        private Parser<S, R, P> statementParser;
        private Function<Object,Pair<PositionInText, String>> codeToPositionAndText;
    }

    @Data
    public static class Preprocessed {
        private List<Object> comments = new ArrayList<>();
        private List<Object> code = new ArrayList<>();
    }

}
