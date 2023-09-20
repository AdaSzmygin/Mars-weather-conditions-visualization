using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class MarsPlanet : MonoBehaviour
{
	List<Texture2D> MarsTexturesCis = null;
	public float timeTexture;
	Material MarsMaterial;

	public List<Texture2D> MarsTexturesCis
	{
		get
		{
			if (MarsTexturesCis == null)
				MarsTexturesCis = Resources.LoadAll<Texture2D>("MarsTexturesCis").
				ToList();

			return MarsTexturesCis;
		}
	}
	// Start is called before the first frame update
	void Start()
	{
		MarsMaterial = transform.gameObject.GetComponent<MeshRenderer>().material;
		StartCoroutine(AnimateMars());
	}
	IEnumerator AnimateMars()
	{
		while(true)
		{
			foreach (var texture in MarsTexturesCis)
			{
				yield return new WaitForSeconds(timeTexture);
				MarsMaterial.SetTexture("_MainTex", texture);
			}
		}
	}
}