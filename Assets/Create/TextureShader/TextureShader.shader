Shader "Custom/TextureShader" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}//エディタで設定できるプロパティ設定（ここではTexureを設定）
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		struct Input {
			float2 uv_MainTex;
		};

		sampler2D _MainTex;

		//1ピクセルごとにSurfメソッドが実行される
		void surf (Input IN, inout SurfaceOutputStandard o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
