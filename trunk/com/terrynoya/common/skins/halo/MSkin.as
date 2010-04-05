package com.terrynoya.common.skins.halo
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	
	import mx.utils.ColorUtil;
	import mx.utils.GraphicsUtil;

	public class MSkin extends Shape implements IMSkin
	{
		private static var tempMatrix:Matrix=new Matrix();
		protected var w:Number;
		protected var h:Number;
		protected var borderColor:uint=0xb7babc;
		protected var cornerRadius:Number=4;
		protected var fillAlphas:Array=[0.6, 0.4, 0.75, 0.65];
		protected var fillColors:Array=[0xffffff, 0xcccccc, 0xffffff, 0xeeeeee];
		protected var highlightAlphas:Array=[0.3, 0, 2];
		protected var themeColor:uint=0xfdff;
		protected var derStyles:Object;
		protected var themeColorDrk1:Number=ColorUtil.adjustBrightness2(themeColor, -25);
		protected var borderColors:Array = [borderColor, 0x898b8d];
		protected var borderColorDrk1:Number=ColorUtil.adjustBrightness2(borderColor, -50);

		public function MSkin()
		{
			super();
			this.derStyles=new Object();
			this.derStyles.bevelHighlight1=0xffffff;
			this.derStyles.bevelHighlight2=0xe0e0e0;
			this.derStyles.fillColorBright1=0xfffff;
			this.derStyles.fillColorBright2=0xd3d3d3;
			this.derStyles.fillColorPress=0xd8f0ff;
			this.derStyles.fillColorPress2=0x99d7ff;
			this.derStyles.themeColDrk1=0x52b4;
			this.derStyles.themeColDrk2=0x84e6;
			this.derStyles.themeColLgt=0x64ffff;
			this.derStyles.fillColorPress1 = 0xd8f0ff;
			this.derStyles.fillColorPress2 = 0x99d7ff;
			
		}
		
		override public function set width(value:Number):void
		{
			this.w = value;
			this.draw();
		} 
		
		override public function set height(value:Number):void
		{
			this.h = value;
			this.draw();
		} 
		
		override public function get height() : Number
		{
			return this.h;
		}
		
		override public function get width() : Number
		{
			return this.w;
		} 
		
		protected function draw():void
		{
			
		}
		
		protected function horizontalGradientMatrix(x:Number, y:Number, width:Number, height:Number):Matrix
		{
			return rotatedGradientMatrix(x, y, width, height, 0);
		}

		protected function verticalGradientMatrix(x:Number, y:Number, width:Number, height:Number):Matrix
		{
			return rotatedGradientMatrix(x, y, width, height, 90);
		}

		protected function rotatedGradientMatrix(x:Number, y:Number, width:Number, height:Number, rotation:Number):Matrix
		{
			tempMatrix.createGradientBox(width, height, rotation * Math.PI / 180, x, y);
			return tempMatrix;
		}

		protected function drawRoundRect(x:Number, y:Number, width:Number, height:Number, cornerRadius:Object=null, color:Object=null, alpha:Object=null, gradientMatrix:Matrix=null, gradientType:String="linear", gradientRatios:Array /* of Number */=null, hole:Object=null):void
		{
			var g:Graphics=graphics;

			// Quick exit if weight or height is zero.
			// This happens when scaling a component to a very small value,
			// which then gets rounded to 0.
			if(width == 0 || height == 0)
				return;

			// If color is an object then allow for complex fills.
			if(color !== null)
			{
				if(color is uint)
				{
					g.beginFill(uint(color), Number(alpha));
				}
				else if(color is Array)
				{
					var alphas:Array=alpha is Array ? alpha as Array : [alpha, alpha];

					if(!gradientRatios)
						gradientRatios=[0, 0xFF];

					g.beginGradientFill(gradientType, color as Array, alphas, gradientRatios, gradientMatrix);
				}
			}

			var ellipseSize:Number;

			// Stroke the rectangle.
			if(!cornerRadius)
			{
				g.drawRect(x, y, width, height);
			}
			else if(cornerRadius is Number)
			{
				ellipseSize=Number(cornerRadius) * 2;
				g.drawRoundRect(x, y, width, height, ellipseSize, ellipseSize);
			}
			else
			{
				GraphicsUtil.drawRoundRectComplex(g, x, y, width, height, cornerRadius.tl, cornerRadius.tr, cornerRadius.bl, cornerRadius.br);
			}

			// Carve a rectangular hole out of the middle of the rounded rect.
			if(hole)
			{
				var holeR:Object=hole.r;
				if(holeR is Number)
				{
					ellipseSize=Number(holeR) * 2;
					g.drawRoundRect(hole.x, hole.y, hole.w, hole.h, ellipseSize, ellipseSize);
				}
				else
				{
					GraphicsUtil.drawRoundRectComplex(g, hole.x, hole.y, hole.w, hole.h, holeR.tl, holeR.tr, holeR.bl, holeR.br);
				}
			}

			if(color !== null)
				g.endFill();
		}
	}
}