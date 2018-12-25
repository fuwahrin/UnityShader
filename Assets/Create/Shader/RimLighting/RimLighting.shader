Shader "Custom/RimLighting" {
	SubShader{
		Tags{ "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard
		#pragma target 3.0

		struct Input
		{
			float2 uv_MainTex;
			float3 worldNormal;
			float viewDir;
		};

		void surf(Input In , inout SurfaceOutputStandard o)
		{
			fixed4 baseColor = fixed4(0.05 , 0.1 , 0 , 1);//基本色用の変数（黒寄りの緑）
			fixed4 rimColor = fixed4(0.5, 0.7, 0.5, 1);//リムの色

			o.Albedo = baseColor;//基本色を設定
			float rim = 1 - saturate(dot(In.viewDir, o.Normal));//輪郭部分の計算（視線ベクトルとオブジェクトの法線ベクトルの内積で取得）saturate:値を０～１にClamp
			//o.Emission = rimColor - rim;
			o.Emission = rimColor * pow(rim, 3);//輪郭部分のエミッシブを強くする
		}
		ENDCG
	}
		FallBack "Diffuse"
}
	

