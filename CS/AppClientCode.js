var columnFilterExtension = (function () {
    var extensionID = "grid-customization-window-filter",
        containerID = "cw-filter-container",
        hideClass = "cw-hide",
        inputStyle = "cw-Search-input";

    var _createElement = function (tag, parent) {
        var element = document.createElement(tag);
        if (parent)
            parent.appendChild(element);
        return element;
    }
    var _findChildren = function (children, tag, res) {
        for (var i = 0, l = children.length; i < l; i++) {
            var element = children[i];
            if (element.nodeName.toLowerCase() == tag)
                res.push(element);
            _findChildren(element.children, tag, res);
        }
    }

    var columnFilterExtension = new function () {
        var that = this;

        that._getTable = function () { return document.querySelector(".customizationWindowContent > table > tbody"); }
        that.lastValue = "";

        that.exists = function () {
            var element = document.querySelector("#" + extensionID);
            return element !== null;
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
            inputElement.classList.add(inputStyle);
            if (inputElement.value)
                inputElement.onchange();

            var parent = that._getTable();
            parent.insertBefore(tr, parent.children[0]);
        }
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
            that.lastValue = this.value;
        }

        that.init = function () {
            if (that.exists())
                return;
            that.appendToDom();
        };

        return that;
    };

    return columnFilterExtension;
})()