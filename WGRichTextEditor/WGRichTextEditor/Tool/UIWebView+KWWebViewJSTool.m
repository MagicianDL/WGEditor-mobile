//
//  UIWebView+KWWebViewJSTool.m
//  KaiWen
//
//  Created by 胡文广 on 2017/11/16.
//  Copyright © 2017年 胡文广. All rights reserved.
//

#import "UIWebView+KWWebViewJSTool.h"

@implementation UIWebView (KWWebViewJSTool)
- (NSString *)contentHtmlText{
    return  [self stringByEvaluatingJavaScriptFromString:@"RE.getHtml();"];
    
}
#pragma mark 标题内容
- (NSString *)titleText{
    return  [self stringByEvaluatingJavaScriptFromString:@"RE.getTitle();"];
}

- (void)setupTitle:(NSString *)title{
    NSString *htmlTitle = [title stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    htmlTitle = [htmlTitle stringByReplacingOccurrencesOfString:@"&middot;" withString:@"·"];
    
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setTitle(\"%@\");",htmlTitle];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}




- (NSString *)contentText{
    NSString *contentStr = [self stringByEvaluatingJavaScriptFromString:@"RE.getText();"];
    return  [contentStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];;
}


- (void)setupContent:(NSString *)content{
    NSString *html = [content stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setHtml(\"%@\");",html];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}


- (void)clearContentPlaceholder{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.clearBackTxt();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

- (void)showContentPlaceholder{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.showBackTxt();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}


- (NSString *)removeQuotesFromHTML:(NSString *)html {
    html = [html stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    html = [html stringByReplacingOccurrencesOfString:@"“" withString:@"&quot;"];
    html = [html stringByReplacingOccurrencesOfString:@"”" withString:@"&quot;"];
    html = [html stringByReplacingOccurrencesOfString:@"\r"  withString:@"\\r"];
    html = [html stringByReplacingOccurrencesOfString:@"\n"  withString:@"\\n"];
    return html;
}

- (void)undo{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.undo();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

- (void)redo{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.redo();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
- (void)bold{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setBold();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
- (void)italic{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setItalic();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
- (void)underline{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setUnderline();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
- (void)justifyLeft{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setJustifyLeft();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

- (void)justifyCenter{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setJustifyCenter();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

- (void)justifyRight{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setJustifyRight();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
- (void)blockQuote{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setBlockquote();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
    
}
- (void)indent{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setIndent();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

- (void)outdent{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setOutdent();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
- (void)unorderlist{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setBullets();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
- (void)orderlist{
    NSString *trigger = [NSString
                         stringWithFormat:@"RE.setNumbers();"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
    
}

- (void)insertLinkUrl:(NSString *)url title:(NSString*)title content:(NSString *)content{
    
//    if (![url isValidUrl]) {
//        url = [NSString stringWithFormat:@"http://%@",url];
//    }
//    KWLog(@"url = %@",url);
//    NSString *trigger= [NSString
//                  stringWithFormat:@"RE.insertLink(\"%@\", \"%@\",\"%@\",);",url,title,content];
//    [self stringByEvaluatingJavaScriptFromString:trigger];

}
- (void)heading1 {
    NSString *trigger = @"RE.setHeading('1');";
    [self stringByEvaluatingJavaScriptFromString:trigger];

}

- (void)heading2 {
    NSString *trigger = @"RE.setHeading('2');";
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

- (void)heading3 {
    NSString *trigger = @"RE.setHeading('3');";
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

//唤醒键盘
- (void)focusTextEditor{
    self.keyboardDisplayRequiresUserAction = NO;
    NSString *js = [NSString stringWithFormat:@"RE.focusEditor();"];
    [self stringByEvaluatingJavaScriptFromString:js];
}
- (void)normalFontSize{
        NSString *trigger = [NSString stringWithFormat:@"RE.setFontSize(\"%@\");", @"3"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

- (void)insertImageUrl:(NSString *)imageUrl alt:(NSString *)alt {
    NSString *trigger = [NSString stringWithFormat:@"RE.insertImage(\"%@\", \"%@\");", imageUrl, alt];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

//获取webView选中内容
- (NSString *)getSelectString{
    return   [self stringByEvaluatingJavaScriptFromString:@"window.getSelection().toString()"];
}
//获取选中内容标签值
- (NSString *)getSelection{
    NSString *tagName = [self stringByEvaluatingJavaScriptFromString:@"window.getSelection().anchorNode.parentNode.tagName.toString()"];
    NSLog(@"%@",tagName);
    return [tagName stringByReplacingOccurrencesOfString:@" " withString:@""];
}
- (void)focus{
    [self stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"article_content\").focus();"];
        [self stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"article_content\").select();"];
    
}


//清除超链接
- (void)clearLink{
      [self stringByEvaluatingJavaScriptFromString:@"RE.clearLink();"];
//    [self showKeyboardContent];
}


//标题聚焦 - 唤醒键盘
- (void)showKeyboardTitle{
    self.keyboardDisplayRequiresUserAction = NO;
    [self stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"article_title\").focus()"];
}

//标题聚焦 - 唤醒键盘
- (void)showKeyboardContent{
    self.keyboardDisplayRequiresUserAction = NO;
    [self stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"article_content\").focus()"];
    
//    [self stringByEvaluatingJavaScriptFromString:@"RE.focus();"];
}

//退出键盘
- (void)hiddenKeyboard{
    [self stringByEvaluatingJavaScriptFromString:@"document.activeElement.blur()"];
}

- (CGFloat)getCaretYPosition{
    
    //    [self stringByEvaluatingJavaScriptFromString:@"RE.calculateEditorHeightWithCaretPosition()"];
    
    return [[self stringByEvaluatingJavaScriptFromString:@"RE.getCaretYPosition();"] floatValue];
}
- (void)autoScrollTop:(CGFloat)offsetY{
    
    NSString *str = [NSString stringWithFormat:@"RE.autoScroll(\"%f\");",offsetY];
    
    [self stringByEvaluatingJavaScriptFromString:str];
}

//font[size="2"]{
//    font-size: 14px;
//}
//font[size="3"]{
//    font-size: 16px;
//}
//font[size="4"]{
//    font-size: 18px;
//}
- (void)setFontSize:(NSString *)size{
    
    NSString *trigger = [NSString stringWithFormat:@"RE.setFontSize(\"%@\");", size];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

//插入编码图片
- (void)inserImage:(NSData *)imageData key:(NSString *)key{
    //    NSData *scaledImageData = UIImageJPEGRepresentation(image, 1);
    NSString *imageBase64String = [imageData base64EncodedStringWithOptions:0];
    
    NSString *trigger = [NSString stringWithFormat:@"RE.insertImageBase64String(\"%@\", \"%@\");",imageBase64String,key];
    
    [self stringByEvaluatingJavaScriptFromString:trigger];
    
}

//图片上传中
- (void)inserImageKey:(NSString *)imageKey progress:(CGFloat)progress{
    NSString *trigger = [NSString stringWithFormat:@"RE.uploadImg(\"%@\", \"%.2f\");",imageKey, progress];
    
    [self stringByEvaluatingJavaScriptFromString:trigger];
    
}
//图片上传成功
- (void)inserSuccessImageKey:(NSString *)imageKey imgUrl:(NSString *)imgUrl{
    NSString *trigger = [NSString stringWithFormat:@"RE.insertSuccessReplaceImg(\"%@\", \"%@\");",imageKey, imgUrl];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
//删除图片
- (void)deleteImageKey:(NSString *)key{
    NSString *trigger = [NSString stringWithFormat:@"RE.removeImg(\"%@\");",key];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}
- (void)setupContentDisable:(BOOL)disable{
    NSString *trigger = [NSString stringWithFormat:@"RE.canFocus(\"%@\");",disable?@"true":@"false"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
    
    [self stringByEvaluatingJavaScriptFromString:@"RE.restorerange();"];
}

// 上传失败
- (void)uploadErrorKey:(NSString *)key{
    NSString *trigger = [NSString stringWithFormat:@"RE.uploadError(\"%@\");",key];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

// 删除失败状态
- (void)removeBtnErrorKey:(NSString *)key isHide:(BOOL)isHide{
    NSString *trigger = [NSString stringWithFormat:@"RE.removeErrorBtn(\"%@\",\"%@\");",key,isHide?@"true":@"false"];
    [self stringByEvaluatingJavaScriptFromString:trigger];
}

@end

@implementation NSString (UUID)

+ (NSString *)uuid {
    CFUUIDRef uuidRef = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, uuidRef);
    NSString *uuid = (__bridge NSString *)uuidString;
    CFRelease(uuidString);
    CFRelease(uuidRef);
    
    return uuid;
}

-(id)jsonObject
{
    NSError *error = nil;
    if (!self) {
        return nil;
    }
    id result = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                                options:NSJSONReadingMutableContainers
                                                  error:&error];
    if (error || [NSJSONSerialization isValidJSONObject:result] == NO)
    {
        //        YKLog(@"json is %@",self);
        return nil;
    }
    
    return result;
}
-(NSString*)stringByAppendingUrlComponent:(NSString*)string{
    
    NSString* urlhost = [self toTrim];
    if([string isBeginWith:@"/"]){
        
        if([urlhost isEndWith:@"/"])
        {
            urlhost = [urlhost substringToIndex:urlhost.length - 1];
        }
    }
    else
    {
        if([urlhost isEndWith:@"/"] == NO)
        {
            urlhost = [urlhost stringByAppendingString:@"/"];
        }
    }
    return [urlhost stringByAppendingString:string];
}
-(BOOL) isBeginWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}

-(BOOL) isEndWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}
-(NSString*) toTrim
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}
@end
