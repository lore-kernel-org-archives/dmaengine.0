Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792601700;
	b=Duo3TpRAgqxQdtzk+CAzPup/r+Xj1ti+N8ATPI+h3zJeROfLLrXO1FtEYKixlDs9ryv7
	 FP865+SBk52YE5KqLZOlmUvYtvLByhDRCM0zAK51XWd5KruFf83T7w5XUIA25Caj4fm6F
	 CoMTDWIa64XETSwnr8HqsBdxO2Q7e/wQKrggTIYJvE+I5qwHuZlh5iFe7EVznt7Me3lhB
	 bvuvl8I/d6x9l47vJQcYdgjWkYjQ4TeaXz1KzM9A6pT+0lChIVOuj82HAXLdLuzffywYS
	 8L4YrYAPOZhaKXnJDCoWtfbvEiBFwq+v/Q9yMGpqjFS3H2X9mtAYztkDULT5oIfcBHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601700;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MJKgMQi8F8UbKO0YyGlUrXDfgYoWNsviAdBAjkW/NoI=;
	b=xM1j6rg9O8+Kq1oopMtvO/MVyt0KzJpM3pptU+9qm89VRXXqWj90d1t4/VbpM2jyHPK0
	 1ck89c7xmbXPkPMAGu78eJJsbHRPcS+n+rIZQGlw8YiiRfCsC0vhpR4KXk/Ri2g3H28Lu
	 B0rrDAME1rWXh1tCCns/FpDpTQB+9pCn3veZw1wOAgIqSUnCP2IU4BPu1qTIEIGbyQ1LS
	 cojhjjE4/Pl+ebPtVrh1bhgSRb4ndjmHRQAcP8W/b1m2rr6YWqoV34ryZYERt6nslOAQy
	 ouBiAqWqsd5adRPhmwWlBpwKJWnLjLTH+LB12GGiDqDA8xTOUxQzP1YASoSNGLdYzyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bvPmaUmZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.34
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CAE606A31A;
	Wed, 21 Oct 2026 16:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12CAE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bvPmaUmZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UULE5Y6csMcgJ9I3UQIMs1m699E92XIspgbfPKWwwyCutEtB9w5KqzsATI6ep3fteBKGSWhZ0p4cA0SFMPcaif/A5j0RZg0QPEne+iGfq6l1yOix6xNIO/JV5n2g5N5+sPGNVoLRtEjDBfozUdvS2FL+or4CPVx/+oFXisGWNkVpnIihBY87KKCObBPIM05FCom4rNdzOUhAvFl3GV9FOenETswsM/BoPmoDlassIXYswsEvFlcUT3gJt65dYhZs1KJ7BYfKJtCWAFKmgsMQ4CkNWfDhImJ2TWjUGGYoJaxpd55RpB88j9uopBQKYIUJILiG30Pn/LQ4wXHIVLaVaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJKgMQi8F8UbKO0YyGlUrXDfgYoWNsviAdBAjkW/NoI=;
 b=S6takTy//L0/TtaVaIEQRJ2Ut07a3jxLsYxUGNtkT8wNNpKejbRBP69EG/15xlmGJvlreN3hV+U87nfOMGrv1Bu6UDRwPEcJrJOmiF1w0DvAa8/mDZlDyfgk0UpaQjQF8E3WmLGvvl/D/yJG3/66V0OZjfYQtrg1GzlMZ6R3f3lgZW9vq2QFqlsNmoUj5peS94Zv764/26bhSE8X/gkKn2VGnt1k2WsxqlW4lN3MFWGD69muc9Em+ktgcM24YIFx6Cbsd72TGpm93ZI1U2la5Ud9/aiGjoCI8QN2hZ/M2f3pgRqcfcSB2/EpQxmwbrpAo6XpoMmbDs7HzzYmm7u9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJKgMQi8F8UbKO0YyGlUrXDfgYoWNsviAdBAjkW/NoI=;
 b=bvPmaUmZgzuOpBcSFw1U4l5KtnFYuOiDi3e989ZGdNGJORsm/ISdIuYdxjJuWi7SiC2tlDzj7ceeThdDlIcbYK3pzIYbJub/Z23spviuXG5QMQrnmon2PLI71qKXYvs5boMLFNts5QNskFwkemb/mcjiHVD1haruBAQrDKx1Lc0ky4P8AkDhw4c8dOw7xX9jlk+vYWsjhkVbm11ViVNn5OpmJNs+WupJb2MjlzaYbP8y6yIhQ3vsWWphFoMA2aJktuDMiqmLQija/3rb1gyaw5mUPi7X3Sk2X+9Qp/XTFtzo695GFIk08kL2COnVbLjtSIZ0+6i3XTLYQu05nThKIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI2PR04MB10165.eurprd04.prod.outlook.com (2603:10a6:800:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 16:54:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:54:53 +0000
Date: Wed, 21 Oct 2026 12:54:45 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruizhe Zhou <zhouruizhe@resnics.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: plx_dma: Remove obsolete 32-bit DMA mask
 fallback
Message-ID: <atjuVRmdyev6cFKF@lizhi-Precision-Tower-5810>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-3-zhouruizhe@resnics.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903115441.912500-3-zhouruizhe@resnics.com>
X-ClientProxiedBy: PH1PEPF00013305.namprd07.prod.outlook.com
 (2603:10b6:518:1::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI2PR04MB10165:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1bc834-e20d-42e1-263c-08df2f94075d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|7416014|23010399003|1800799024|261009223027099003|10067099003|56012099006|261021123027099002|6133799003|22082099003|18002099003|261021121427099002|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	USuuUcJcUiOG6gKpc227RkieLUao7bCNTmyQV2OfDEVqjkEVc8S8kEDlXxKUkY+SQziqdNuEQGFpmloSseBE1gPttxiVusurZ8XClIJowOaGSAclRAmO9+OPlqbbGWes5iLZ8ASPBeseervjTUaIYNpKO/vr7maQQvoiZbP6gBa3x3LPWDrVg5On6RlRPJtXteadYy881SgEojlawymNrjyvRhF2WxxVfIfJWgqOR5f2xB9vLu11QU1a4TlCeNSHD76mJtQgCMNKjGvYQl2Ji5NwFZYcrpE3Ibbze6JH+Q36fHWgeR1Ab75AKaD9pgSkVp+B5lbP+NqEJ+Lul/Wrm8j6Y4/R9j2PMOdxRDUwqQ+ONpmTjwmlNuk69go95J51SoOabBObX6Z3dtvBK4fHojAllObPwoK3mrWWUDWocW3nD5kIZi9x2/UwAyR9JaNv4yLtSePq+i0uqmrqqjsR/2Lof1AZCdWwX8advDRe2JX6bNHK0que9wfdluuJ4+ECimOWfwaNVz6fcJs1UbV01fCVrxqtxIMRpUS7ZOQkN8Ka7QRzK//E5liqQKwca5obzuZuakGNLQDCzcWxe5L+Pb1+4h2xVFGnTVDA3Wbg5gQ6g82KVR//kf6MU1vUcxnM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(261021123027099002)(6133799003)(22082099003)(18002099003)(261021121427099002)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xSOMAGdoPsw4GSNrSA3pSaG5dFo1i7e5KZIixAoJIL8nR+tJB68YtaBcKmTG?=
 =?us-ascii?Q?a4KqCgMAuBPwoGDCSFFEV+dUYXPI1u++AgCB/7w1JFYJuNwt5DHHnSiLewZR?=
 =?us-ascii?Q?4Cl/lpBTdsKFH0YMY/VwZ3CaHwnTJ9f7nLx46wunqhAn5C7+YL3wM5hi8FAM?=
 =?us-ascii?Q?Wbi//Z1c8y60UrV6bwxpMwS6HRlhT27AyzGsh9jONvSyKO3d+uuYCGxrhSYS?=
 =?us-ascii?Q?KnzWmuFCEPGf6o/c118QZbGfxFNn/vgcAyxOqhLjtk/BM0p6PTqpf+jMskgS?=
 =?us-ascii?Q?dE8TlUTVUozK0fZ139it/akhtJ2zwmQklfEYZWfsQ+do4TWZr3T/d6mCeyjx?=
 =?us-ascii?Q?8w6vawvKEzJqh7/Ka5X5KaQ7J6gYSJ/h9ZA1jxUf/X6mqOH66mIdKRdXV+lR?=
 =?us-ascii?Q?9cHLnqKvMzUW2PyTd4zepa+VT3JG2iJ4Xv3AoSPySH7p+xvrQYLx52GXWK1a?=
 =?us-ascii?Q?oTeIN9e9H5L+VTGpIJbhVjEP+lWY0+o6b1THuMLDa4i4+I4xcPRJANbRptE+?=
 =?us-ascii?Q?nKhy2j2AGmdS7XYcIOHE2XPoB/hlMZAwPcTAx38a45cwswEbDvWHjUbqe5mB?=
 =?us-ascii?Q?jbL7R63kMWH2fy3OifbjlOfB78XBI5oUCFwoTz5oFIP5hEwqOBIqmp/zQCfB?=
 =?us-ascii?Q?DYLiR5i/CMfJgToeGuuziTvonChlVZWUx1HTrPrmyt0vfdIadsYXNA+LO0il?=
 =?us-ascii?Q?pVycfvV8+lexGaeVEVeHiUOTVOse7jWkVKII6Xdo0dVF6vAEU6hjqsNGc+2h?=
 =?us-ascii?Q?OXw9Z8TBZLmaZwNEOI+xglTXzIM4csBkRZEziTrMdlzO8ibTnDmARi9N66z0?=
 =?us-ascii?Q?begnOl0cusElCO4+19kKRdiIe2VwQCYrmr6sG7S510Tn7v+oG9+b226md/LB?=
 =?us-ascii?Q?KlGbZPdObVAiVUOK+WPllxX8Rr26stdD9+xmhqGDF1ec2hYc/pTtMM2xRD5P?=
 =?us-ascii?Q?rTKNraNsaPkUqALTk/hFyNXnkYpOuHSN18StVW/P854qYMvQPQDnTP4Xi6dB?=
 =?us-ascii?Q?NtoOzV7lfyojM18wbOLkveM/YRjYSc0W4rbb5Un+TE58XspcJdEArSA/UY+r?=
 =?us-ascii?Q?8bi4o0xux+e6DBA7lhESrIGQDG9dzn2ppOQIExps0QgnNUGuIkgwbxCjFC6U?=
 =?us-ascii?Q?qy4KQlYoHTAGYT+TdcKVPts/MRshWuqj+SKFyE5opsuJpO/NcgR2rSHKyfiT?=
 =?us-ascii?Q?aUCWHXc9MtULJSuhP7/38l07/7QbnHoFVxyr+PNP8pgh4fbeFlOC2jwd1eHA?=
 =?us-ascii?Q?5dV6Ulk/Zl1Zt6NqenqMcuM3y3cNnHiAoMJY+OVlWI+Hky2Pn3VV1ZD6iSAr?=
 =?us-ascii?Q?oOksaxTR5EksoVO2Q4mJxp3JT6LaAg3tOgBN1G/gLsEEQ0D+4HuPIc0DhBA4?=
 =?us-ascii?Q?56JLC+0m6hkpIFRVAMLsaY5JhqXeMILotk/0ajWfC76ux77JAv3hxjOjKqfN?=
 =?us-ascii?Q?hLsZZ/IjRs9rXldzbvdBm+nkJh4LScQSCjaMcGTJ5Dm3GGU3EtM607PPzvgw?=
 =?us-ascii?Q?3n5NcwiSvMZ/ONHcznRe+U0Jrj0IWXfnQg2UFXDZRpyt4dFENMslkOh9fDf1?=
 =?us-ascii?Q?8NW+ckEY3jVcmo+bDJIHb+dqxAClgHUJtleDvf2XX2FrliwYRJ4UXYWZjpBN?=
 =?us-ascii?Q?fmttdOD/BeJrcmhqlRnDdnxiND0VZPv5+VJjmPz8T62OU+8DrMtrTPmbcExn?=
 =?us-ascii?Q?oA4aXue5cia7PeNxvOQhPG8RSXifHBrj+FYXjWx5BEuQZoWDc4hSm1bYDtnH?=
 =?us-ascii?Q?SdcmhVD2YqsdzGFajPq2eJk5V7JlUkobxUZ21UYxueegbBllXsY2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1bc834-e20d-42e1-263c-08df2f94075d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:54:53.5810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KU45/UCLVXW3frvlVop2W6D3G2/QDr/q9+yyxI0Yynx8BhihdiVEZevkTmP3Wl5R0oGXKm9vRU8K9ENld3DA1eiITr+mjkep3xqXGb7dQ6tgBO2QkcpqdM3imYRk78wN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10165

On Thu, Sep 03, 2026 at 07:54:40PM +0800, Ruizhe Zhou wrote:
> The DMA API guarantees support for masks of 32 bits or wider and
> explicitly identifies retrying a 32-bit mask after a wider request as
> incorrect:
> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities
>
> Remove the obsolete fallback while retaining the error check so that a
> genuine DMA setup failure is still propagated and aborts initialization.
>
> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> ---

Eventhough needn't check when 48bit, but remove fallback is correct.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/plx_dma.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 84941a918b01..ad9187448ed2 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -562,8 +562,6 @@ static int plx_dma_probe(struct pci_dev *pdev,
>  		return rc;
>
>  	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(48));
> -	if (rc)
> -		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>  	if (rc)
>  		return rc;
>
> --
> 2.27.0
>
