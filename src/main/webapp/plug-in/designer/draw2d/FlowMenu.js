/**
 * This notice must be untouched at all times. This is the COMPRESSED version of
 * Draw2D WebSite: http://www.draw2d.org Copyright: 2006 Andreas Herz. All
 * rights reserved. Created: 5.11.2006 by Andreas Herz (Web:
 * http://www.freegroup.de ) LICENSE: LGPL
 */

draw2d.FlowMenu = function(_20d3) {
	this.actionDelete = new draw2d.ButtonDelete(this);
	// this.actionFront = new draw2d.ButtonMoveFront(this);
	// this.actionBack = new draw2d.ButtonMoveBack(this);
	draw2d.ToolPalette.call(this);
	this.setDimension(20, 60);
	this.setBackgroundColor(new draw2d.Color(220, 255, 255));
	this.currentFigure = null;
	this.myworkflow = _20d3;
	this.added = false;
	this.setDeleteable(false);
	this.setCanDrag(false);
	this.setResizeable(false);
	this.setSelectable(false);
	this.setBackgroundColor(null);
	this.setColor(null);
	this.scrollarea.style.borderBottom = "0px";
	this.actionDelete.setPosition(0, 0);
	// this.actionFront.setPosition(0, 18);
	// this.actionBack.setPosition(0, 36);
	this.addChild(this.actionDelete);
	// this.addChild(this.actionFront);
	// this.addChild(this.actionBack);
};
draw2d.FlowMenu.prototype = new draw2d.ToolPalette;
draw2d.FlowMenu.prototype.setAlpha = function(_20d4) {
	draw2d.Figure.prototype.setAlpha.call(this, _20d4);
};
draw2d.FlowMenu.prototype.hasTitleBar = function() {
	return false;
};
draw2d.FlowMenu.prototype.onSelectionChanged = function(_20d5) {
	if (_20d5 == this.currentFigure) {
		return;
	}
	if (this.added == true) {
		this.myworkflow.removeFigure(this);
		this.added = false;
	}
	if (_20d5 != null && this.added == false) {
		if (this.myworkflow.getEnableSmoothFigureHandling() == true) {
			this.setAlpha(0.01);
		}
		this.myworkflow.addFigure(this, 100, 100);
		this.added = true;
	}
	if (this.currentFigure != null) {
		this.currentFigure.detachMoveListener(this);
	}
	this.currentFigure = _20d5;
	if (this.currentFigure != null) {
		this.currentFigure.attachMoveListener(this);
		this.onOtherFigureMoved(this.currentFigure);
	}
};
draw2d.FlowMenu.prototype.setWorkflow = function(_20d6) {
	draw2d.Figure.prototype.setWorkflow.call(this, _20d6);
};
draw2d.FlowMenu.prototype.onOtherFigureMoved = function(_20d7) {
	try {
		var pos = _20d7.getPosition();
		this.setPosition(pos.x + _20d7.getWidth(), pos.y);
	} catch (e) {
		if (_20d7.startX && _20d7.endX) {
			var points = _20d7.getPoints();
			var startX = points.get(points.size - 2).x;
			var startY = points.get(points.size - 2).y;
			var endX = points.get(points.size - 1).x;
			var endY = points.get(points.size - 1).y;
			var poX = _20d7.endX;
			var poY = _20d7.endY;
			if (startX == endX) {
				poX = startX - 30;
				poY = (Math.abs(endY - startY) / 2 + Math.min(startY, endY))
						- 20;
			} else if (startY == endY) {
				poX = Math.abs(endX - startX) / 2 + Math.min(startX, endX) - 30;
				poY = startY - 20;
			} else {
				poX = Math.abs(endX - startX) / 2 + Math.min(startX, endX) - 30;
				poY = Math.abs(endY - startY) / 2 + Math.min(startY, endY) - 20;
			}
			this.setPosition(poX, poY);
		}
	}
};