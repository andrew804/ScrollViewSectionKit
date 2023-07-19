//
//  AnyScrollViewSectionStyle.swift
//  ScrollViewSectionKit
//
//  Created by Pavol Kmet on 13/04/2023.
//
//  MIT License
//
//  Copyright (c) 2023 Pavol Kmet
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI

public struct AnyScrollViewSectionStyle: ScrollViewSectionStyle {
    
    // MARK: - Properties - Private
    
    private var _sectionClipShape: AnyShapeBackport
    private var _rowContentInsets: ScrollViewSectionPaddingType
    private var _rowSeparatorInsets: ScrollViewSectionPaddingType
    private var _rowBackgroundColor: Color?
    private var _rowSeparatorColor: Color?
    private var _makeContent: (ContentConfiguration) -> AnyView
    private var _makeHeader: (HeaderConfiguration) -> AnyView
    private var _makeRow: (RowConfiguration) -> AnyView
    private var _makeFooter: (FooterConfiguration) -> AnyView
    
    // MARK: - Initialization - Public
    
    init(style: any ScrollViewSectionStyle) {
        self._sectionClipShape = style.sectionClipShape
        self._rowContentInsets = style.rowContentInsets
        self._rowBackgroundColor = style.rowBackgroundColor
        self._rowSeparatorInsets = style.rowSeparatorInsets
        self._rowSeparatorColor = style.rowSeparatorColor
        self._makeContent = { configuration in
            AnyView(style.makeContentBody(configuration: configuration))
        }
        self._makeHeader = { configuration in
            AnyView(style.makeHeaderBody(configuration: configuration))
        }
        self._makeRow = { configuration in
            AnyView(style.makeRowBody(configuration: configuration))
        }
        self._makeFooter = { configuration in
            AnyView(style.makeFooterBody(configuration: configuration))
        }
    }
    
    // MARK: - IScrollViewSectionStyle
    
    public var sectionClipShape: AnyShapeBackport {
        return _sectionClipShape
    }
    
    public var rowContentInsets: ScrollViewSectionPaddingType {
        return _rowContentInsets
    }
    
    public var rowBackgroundColor: Color? {
        return _rowBackgroundColor
    }
    
    public var rowSeparatorInsets: ScrollViewSectionPaddingType {
        return _rowSeparatorInsets
    }
    
    public var rowSeparatorColor: Color? {
        return _rowSeparatorColor
    }
    
    public func makeContentBody(configuration: ContentConfiguration) -> some View {
        _makeContent(configuration)
    }
    
    public func makeHeaderBody(configuration: HeaderConfiguration) -> some View {
        _makeHeader(configuration)
    }
    
    public func makeRowBody(configuration: RowConfiguration) -> some View {
        _makeRow(configuration)
    }
    
    public func makeFooterBody(configuration: FooterConfiguration) -> some View {
        _makeFooter(configuration)
    }
    
}
