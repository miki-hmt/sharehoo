/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	
	// %REMOVE_START%
	// The configuration options below are needed when running CKEditor from source files.
	
	config.removeButtons = 'Save,About,CreateDiv,Underline,Source,Print,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Iframe,Link,Unlink,Anchor,Table,HorizontalRule,PageBreak,NumberedList,BulletedList,Blockquote,BidiLtr,BidiRtl,Subscript,Superscript,Strike,Underline,TextColor,BGColor,Styles,FontSize';	//2017.05.30  移除不需要的按钮
	
	config.plugins = 'dialogui,dialog,dialogadvtab,newpage,basicstyles,blockquote,button,toolbar,maximize,clipboard,panelbutton,panel,floatpanel,colorbutton,colordialog,templates,menu,contextmenu,copyformatting,div,resize,find,fakeobjects,flash,floatingspace,font,format,horizontalrule,htmlwriter,wysiwygarea,image,uploadwidget,filetools,filebrowser,indent,indentblock,indentlist,smiley,justify,menubutton,language,link,pastetext,pastefromword,preview,removeformat,selectall,showborders,sourcearea,specialchar,scayt,stylescombo,tab,undo,uploadimage,wsc,codesnippet,simage,imageuploader,markdown,uicolor';
	config.skin = 'kama';
	config.image_previewText='我们这有矿哦，快来sharehoo.cn'; //预览区域显示内容
	config.filebrowserImageUploadUrl ="UploadAction.action"; //固定路径 ，文件上传  2017.05.30 
	// %REMOVE_END%

	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	config.uiColor = '#85735F';
	config.ui = 'rgb(255, 254, 253)';
};
