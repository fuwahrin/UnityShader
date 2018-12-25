Shader "Custom/IceShader" {
	
	SubShader {
		Tags { "Queue"="Transparent" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard alpha:fade

		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float3 worldNormal;//輪郭の法線ベクトル
			float3 viewDir;//視線ベクトル
		};

		UNITY_INSTANCING_BUFFER_START(Props)
			// put more per-instance properties here
		UNITY_INSTANCING_BUFFER_END(Props)

		void surf (Input IN, inout SurfaceOutputStandard o) {
			o.Albedo = fixed4(1, 1, 1, 1);//RGBAで色を指定（今回は白）

			float alpha = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));//視線ベクトルと輪郭法線ベクトルの角度を求めるために内積（dot）を使用
			//※（垂直に交わる場合は0、平行の場合は1または-1になる）垂直の場合は透明度を１平行の場合は透明度を０にするため絶対値から１を引いている

			o.Alpha = alpha * 3.0f;//ここでかけている数字で強さを変える
		}
		ENDCG
	}
	FallBack "Diffuse"
}
