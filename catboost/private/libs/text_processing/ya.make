LIBRARY()




SRCS(
    dictionary.cpp
    embedding.cpp
    embedding_loader.cpp
    text_column_builder.cpp
    text_dataset.cpp
    tokenizer.cpp
)

PEERDIR(
    catboost/libs/helpers
    catboost/private/libs/data_types
    catboost/private/libs/options
    library/text_processing/dictionary
    library/threading/local_executor
)


END()
