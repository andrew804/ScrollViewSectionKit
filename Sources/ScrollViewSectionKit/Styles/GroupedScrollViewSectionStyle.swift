//
//  GroupedScrollViewSectionStyle.swift
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

public struct GroupedScrollViewSectionStyle: ScrollViewSectionStyle {
    
    // MARK: - IScrollViewSectionStyle
    
    public var sectionClipShape: AnyShapeBackport {
        return AnyShapeBackport(Rectangle())
    }
    
    public var rowContentInsets: ScrollViewSectionPaddingType {
        return .edges(.horizontal, 20.0)
    }
    
    public var rowBackgroundColor: Color? {
    #if os(iOS)
        return Color(UIColor.secondarySystemGroupedBackground)
    #else
        return Color.white
    #endif
    }
    
    public var rowSeparatorInsets: ScrollViewSectionPaddingType {
        return .edges(.leading, 20.0)
    }
    
    public var rowSeparatorColor: Color? {
        return nil
    }
    
    @ViewBuilder
    public func makeContentBody(configuration: ContentConfiguration) -> some View {
        configuration.label
            .padding(.vertical, 10.0)
            .padding(.horizontal, 0.0)
    }
    
    @ViewBuilder
    public func makeHeaderBody(configuration: HeaderConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 0.0) {
            configuration.label
                .font(Font.footnote)
                .foregroundColor(Color.secondary)
                .padding(.top, 10.0)
                .padding(.bottom, 8.0)
                .padding(.horizontal, 20.0)
            Divider()
        }
    }
    
    @ViewBuilder
    public func makeRowBody(configuration: RowConfiguration) -> some View {
        configuration.label
    }
    
    @ViewBuilder
    public func makeFooterBody(configuration: FooterConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Divider()
            configuration.label
                .font(Font.footnote)
                .foregroundColor(Color.secondary)
                .padding(.top, 10.0)
                .padding(.bottom, 0.0)
                .padding(.horizontal, 20.0)
        }
    }
    
}

// MARK: - Extension - ScrollViewSectionStyle - Public

public extension ScrollViewSectionStyle where Self == GroupedScrollViewSectionStyle {
    
    static var grouped: GroupedScrollViewSectionStyle {
        return GroupedScrollViewSectionStyle()
    }
    
}
