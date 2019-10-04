#pragma once

#include <catboost/private/libs/options/load_options.h>
#include <catboost/libs/data/meta_info.h>
#include <library/json/json_reader.h>

void ConvertIgnoredFeaturesFromStringToIndices(const NCatboostOptions::TPoolLoadParams& poolLoadParams, NJson::TJsonValue* catBoostJsonOptions);
void ConvertIgnoredFeaturesFromStringToIndices(const NCB::TDataMetaInfo& metaInfo, NJson::TJsonValue* catBoostJsonOptions);
