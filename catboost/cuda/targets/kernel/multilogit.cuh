#pragma once


#include <catboost/cuda/cuda_lib/kernel/kernel.cuh>
#include <catboost/private/libs/options/enums.h>

namespace NKernel {

    void MultiLogitValueAndDer(const float* targetClasses, int numClasses,
                               const float* targetWeights,
                               ui32 size,
                               const float* predictions, ui32 predictionsAlignSize,
                               const ui32* loadPredictionsIndices,
                               float* functionValue,
                               float* der, ui32 derAlignSize,
                               TCudaStream stream);

    void MultiLogitSecondDer(const float* targetClasses, int numClasses,
                             const float* targetWeights,
                             ui32 size,
                             const float* predictions, ui32 predictionsAlignSize,
                             float* der2,
                             int der2Row, ui32 der2AlignSize,
                             TCudaStream stream);


    void MultiClassOneVsAllValueAndDer(const float* targetClasses, int numClasses,
                                       const float* targetWeights,
                                       ui32 size,
                                       const float* predictions, ui32 predictionsAlignSize,
                                       const ui32* loadPredictionsIndices,
                                       float* functionValue,
                                       float* der, ui32 derAlignSize,
                                       TCudaStream stream);

    void MultiClassOneVsAllSecondDer(const float* targetClasses, int numClasses,
                                     const float* targetWeights,
                                     ui32 size,
                                     const float* predictions, ui32 predictionsAlignSize,
                                     float* der2,
                                     ui32 der2AlignSize,
                                     TCudaStream stream);



    void BuildConfusionMatrixBins(const float* targetClasses, int numClasses, ui32 size,
                                  const float* predictions, int predictionsDim,
                                  ui32 predictionsAlignSize,
                                  bool isBinClass,
                                  ui32* bins,
                                  TCudaStream stream);

}
