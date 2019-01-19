//===-- SWIG Interface for SBStructuredData ---------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

namespace lldb {

    %feature("docstring",
             "A class representing a StructuredData event.

              This class wraps the event type generated by StructuredData
              features."
             ) SBStructuredData;
    class SBStructuredData
    {
    public:
        SBStructuredData();

        SBStructuredData(const lldb::SBStructuredData &rhs);

        SBStructuredData(const lldb::EventSP &event_sp);

        ~SBStructuredData();

        bool
        IsValid() const;

        void
        Clear();

        lldb::SBStructuredData &operator=(const lldb::SBStructuredData &rhs);

        lldb::StructuredDataType GetType() const;

        size_t GetSize() const;

        bool GetKeys(lldb::SBStringList &keys) const;

        lldb::SBStructuredData GetValueForKey(const char *key) const;

        lldb::SBStructuredData GetItemAtIndex(size_t idx) const;

        uint64_t GetIntegerValue(uint64_t fail_value = 0) const;

        double GetFloatValue(double fail_value = 0.0) const;

        bool GetBooleanValue(bool fail_value = false) const;

        size_t GetStringValue(char *dst, size_t dst_len) const;

        lldb::SBError
        GetAsJSON(lldb::SBStream &stream) const;

        lldb::SBError
        GetDescription(lldb::SBStream &stream) const;

        lldb::SBError
        SetFromJSON(lldb::SBStream &stream);
    };
}
