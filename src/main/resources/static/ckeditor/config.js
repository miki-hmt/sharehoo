/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 * plugin:
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';'a11yhelp' : 1,
	
	config.toolbar = 'Full';
	 
	config.toolbar_Full =
	[
	    { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
	    { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
	    { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
	    { name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 
	        'HiddenField' ] },
	    { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
	    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
	    '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
	    { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
	    { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
	    '/',
	    { name: 'insert', items : [ 'Flash','Smiley','Image','Table','HorizontalRule','SpecialChar','PageBreak','Iframe' ] },
	    { name: 'colors', items : [ 'TextColor','BGColor' ] },
	    { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
	];
	 
	config.toolbar_Basic =
	[
	    ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','About']
	]; 

		
	config.removeButtons = 'Save,About,CreateDiv,Underline,Source,Print,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Iframe,Link,Unlink,Anchor,Table,HorizontalRule,PageBreak,NumberedList,BulletedList,Blockquote,BidiLtr,BidiRtl,Subscript,Superscript,Strike,Underline,TextColor,BGColor,Styles,FontSize';	//2017.05.30  移除不需要的按钮
	config.filebrowserImageUploadUrl = "CKUploadAction.action"; //固定路径 ，文件上传  2017.05.30 
    config.image_previewText=' '; //预览区域显示内容
	config.uiColor = '#85735F';
	config.ui = 'rgb(255, 254, 253)';
	//config.width = "680"; //文本域宽度
    //config.height = "460";//文本域高度
    config.skin='kama';	//2017.05.30  设置ui界面
};
