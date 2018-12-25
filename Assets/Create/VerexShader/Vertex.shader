Shader "Custom/Vertex" {
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Lambert vertex:vert//#pragmaの行に「vertex:頂点シェーダのメソッド名」と書くことで、Unityに頂点シェーダをカスタムで作成することを伝える
		#pragma target 3.0

		struct Input {
			float4 vertColor;
		};


		void vert(inout appdata_full v, out Input o)//appdata_full:位置、接線、法線、4 つのテクスチャ座標および色で構成されている
		{
			UNITY_INITIALIZE_OUTPUT(Input, o);//出力の値を初期化する
			o.vertColor = v.color;//appdata_full型のcolor変数から頂点カラーの情報を取り出し、Input型のvertColor変数に値を詰めている

		}

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = IN.vertColor.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
