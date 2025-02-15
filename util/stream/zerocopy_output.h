#pragma once

#include <util/system/yassert.h>

#include "output.h"

/**
 * @addtogroup Streams
 * @{
 */

/**
 * Output stream with direct access to the output buffer.
 *
 * Derived classes must implement `DoNext` and `DoAdvance` methods.
 */
class IZeroCopyOutput: public IOutputStream {
public:
    IZeroCopyOutput() noexcept = default;
    ~IZeroCopyOutput() override = default;

    IZeroCopyOutput(IZeroCopyOutput&&) noexcept = default;
    IZeroCopyOutput& operator=(IZeroCopyOutput&&) noexcept = default;

    /**
     * Returns the next buffer to write to from this output stream.
     *
     * @param ptr[out]                  Pointer to the start of the buffer.
     * @returns                         Size of the returned buffer, in bytes.
     *                                  Return value is always nonzero.
     */
    template <class T>
    inline size_t Next(T** ptr) {
        Y_ASSERT(ptr);

        return DoNext((void**)ptr);
    }

    /**
     * Moves the current position in stream by `len` bytes.
     * `len` must not be greater than the size of the buffer previously returned by `Next`.
     *
     * @param len[in]                  Number of bytes to move the position by.
     *
     */
    inline void Advance(size_t len) {
        return DoAdvance(len);
    }

protected:
    void DoWrite(const void* buf, size_t len) override;
    virtual size_t DoNext(void** ptr) = 0;
    virtual void DoAdvance(size_t len) = 0;
};

/** @} */
