Shader "Custom/Water" {
	Properties {
		_MainTex ("WaterTexture", 2D) = "white" {}//テクスチャ設定
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		
		
		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed2 uv = IN.uv_MainTex;//テクスチャのどの部分を使用するか変数宣言
			//オフセットをどれだけ足すかスクロール速度＊時間で計算
			uv.x += 0.1 * _Time;
			uv.y += 0.8 * _Time;
			o.Albedo = tex2D(_MainTex, uv);//テクスチャをスクロールさせるために
		}
		ENDCG
	}
	FallBack "Diffuse"
}
