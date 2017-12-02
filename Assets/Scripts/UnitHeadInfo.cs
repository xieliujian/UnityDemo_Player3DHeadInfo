using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UnitHeadInfo : MonoBehaviour
{
    #region 变量

    /// <summary>
    /// 基准尺寸
    /// </summary>
    public const float BENCHMARKSIZE = 300.0f;

    /// <summary>
    /// 单位
    /// </summary>
    public GameObject mUnit;

    /// <summary>
    /// 缩放锚点x
    /// </summary>
    public GameObject mSclAnchorX;

    /// <summary>
    /// 缩放锚点y
    /// </summary>
    public GameObject mSclAnchorY;

    /// <summary>
    /// 显示的根节点
    /// </summary>
    public GameObject mShowRoot;

    #endregion

    #region 内置函数

    // Use this for initialization
    void Start ()
    {
        
    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    private void LateUpdate()
    {
        if (Launcher.Instance == null)
        {
            SetVisible(false);
            return;
        }
        
        Vector3 mepos = Launcher.Instance.Me.transform.position;
        Vector3 unitpos = mUnit.transform.position;
        mepos.y = unitpos.y = 0.0f;
        float distance = Vector3.Distance(mepos, unitpos);
        if (distance > 30.0f)
        {
            SetVisible(false);
            return;
        }

        SetVisible(true);
        LookatCamera();
        CalcScale();
    }

    #endregion

    #region 函数

    private void LookatCamera()
    {
        transform.rotation = Camera.main.transform.rotation;
    }

    private void CalcScale()
    {
        Vector3 posx = mSclAnchorX.transform.position;
        Vector3 posy = mSclAnchorY.transform.position;
        posx = Camera.main.WorldToScreenPoint(posx);
        posy = Camera.main.WorldToScreenPoint(posy);
        float anchordis = Vector3.Distance(posx, posy);
        float scale = BENCHMARKSIZE / anchordis;

        mShowRoot.transform.localScale = new Vector3(scale, scale, 1.0f);
    }

    public void SetVisible(bool vis)
    {
        mShowRoot.SetActive(vis);
    }

    #endregion
}
