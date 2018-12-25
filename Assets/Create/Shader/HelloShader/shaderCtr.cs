using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class shaderCtr : MonoBehaviour {

	// Use this for initialization
	void Start () {
        GetComponent<Renderer>().material.SetColor("_BaseColor", Color.black);	
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
