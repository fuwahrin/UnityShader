Shader "Custom/StendGrass" {
	Properties {
		_MainTex ("texture", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Transparent" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard alpha:fade
		#pragma target 3.0


		struct Input {
			float2 uv_MainTex;
		};

		sampler2D _MainTex;//Propertiesの値をシェーダーないで使用するために定義

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);//UV座標（uv_MainTex）からテクスチャ（_MainTex）のピクセルの色を計算して変返す
			o.Albedo = c.rgb;
			o.Alpha = ((c *0.3 + c.g * 0.6 + c.b*0.1 < 0.2) ? 1 : 0.7);//基本色からグレースケールに変換する、グレースケールが0.2以下の場合透明度を1に0.2より大きい場合は透明度を0.7に設定
		}
		ENDCG
	}
	FallBack "Diffuse"
}
