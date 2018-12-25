Shader "Custom/Flag" {
	Properties {
		_MainTex ("Albedo (RGB)", 2D) = "white" {}

	}
	SubShader {
		//Tags { "RenderType"="Opaque" }
		Tags { "RenderType"="Geometory-2" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Lambert vertex:vert//頂点シェーダーをカスタムで作成
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		void vert(inout appdata_full v , out Input o)
		{
			UNITY_INITIALIZE_OUTPUT(Input , o);
			float amp = 0.5*sin(_Time*100 + v.vertex.x * 100);//sin関数を使用して時間とともに頂点のY座標を変化させる
			v.vertex.xyz = float3(v.vertex.x , v.vertex.y+amp , v.vertex.z);

		}

		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 c= tex2D(_MainTex , IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
