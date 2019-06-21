<!-- default file list -->
*Files to look at*:

* [AppClientCode.js](./CS/AppClientCode.js) (VB: [AppClientCode.js](./VB/AppClientCode.js))
* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
<!-- default file list end -->
# ASPxGridView - How to implement search in the Column Chooser window
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t591169)**
<!-- run online end -->


<p>This example illustrates how to add an input element to the Column Chooser window and filter columns in this window.<br>First of all, create an input element and append it to the Column Chooser dom elements:</p>


```js
var _createElement = function (tag, parent) {
	var element = document.createElement(tag);
	if (parent)
		parent.appendChild(element);
	return element;
}
 that.appendToDom = function () {
	var tr = _createElement("tr");
	tr.id = containerID;
	var td = _createElement("td", tr);
	var inputContainer = _createElement("div", td);
	inputContainer.id = extensionID;
 	var inputElement = _createElement("input", inputContainer);
	inputElement.type = "text";
	inputElement.onchange = that.onchange;
	inputElement.value = that.lastValue;
	if (inputElement.value)
		inputElement.onchange();
 	var parent = that._getTable();
	parent.insertBefore(tr, parent.children[0]);
}
```


<p>Note, that to correctly append the input element to the Column Chooser window, handle the client-side Init and EndCallback events and add the input element there.<br>After that, handle the onchange event and search for a typed value through the html table that contains field names:</p>


```js
that.onchange = function () {
	var newText = this.value.toLowerCase();
	var children = that._getTable().children;
	for (var i = 0, l = children.length; i < l; i++) {
		var _tr = children[i];
		if (_tr.id == containerID)
			continue;
		_tr.classList.remove(hideClass);
		
		var _tds = [];
		_findChildren(_tr.children, "td", _tds)
 		var hasText = _tds.filter(function (item) {
			return item.textContent.toLowerCase().indexOf(newText) > -1
		}).length > 0;
		if (!hasText)
			_tr.classList.add(hideClass);
	}
	that.lastValue = newText;
}
```


<p>It is possible to hide a row with a field name that doesn't contain the typed text by setting a certain CSS class to the row element:</p>


```css
tr.cw-hide {
	display: none;
}
```



<br/>


