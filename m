Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6F32DC331;
	Wed,  1 Jul 2026 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917270; cv=fail; b=fmAsGntnBvtue6/wFnZm6TomNrEPP/WrpKvjoWaG1drhcS05eTh10Aubn+B1aeVeEOm5z5P0m80+sdmq+xitd9GPZA6XgGr0c1bix75mxxqj/OLLVgMfjo9CYO1JrWSPV+/FHP7hQWv61v5x2BHTzZd8+Lj1SmKhh/1d0nrLPKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917270; c=relaxed/simple;
	bh=2bc5aqE1pwS7wG0fcBh9tlue9gAR1pSGN7dz7MHh28o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oMcoz+ZAbpMwy/WYxOGLnyzEbpsffJOBpvQTqCqslv3G0iTLUGowVGTfOcrKwZ95xfnr7HNcCnlrqkprhaKtvKSPQf23G3eq2iN2wfjs5SP4QL9mD9sbek+4/sE8OPfrl3HosebvxQHVYe439XQIH1ASOLmFwlK93jCr+8dT3XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bxjPUREu; arc=fail smtp.client-ip=52.101.83.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bxjPUREu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AK/DPgzGZnroDmGm0kIVETu86Mm+5RuhPBSBfIOCoXpcki89Ag9/DST9jx5gXUhUtgH1Bdz8IH/hexDsOjtAW0Ll4ec6m/5OQMgAHi7kKY2c9Xw+JmxyWmNgmP3TZbKk/E7HNIuxeOJ+UAjmu5VeboAhKWMZKxuo6zPt1Re6+X2DLBSWB31JbNc7EowGXuXjgLk6dBP0/I1+ugfm+nJThgLoZ2kfxBtOeGM+uBULWCN2pZfnUYWIEUqVgw5t59svIctYzwBjLsnwEnc9L/YRkHQJQNOCna28oc4LW09IlGDJM5h+x1cxV4BsQX2+vhpp6g9p6TS4LwwXRRXF20VYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jx7CRyyBksYU7DsZBMtVUusWFNV63KtveG8iipofoA=;
 b=O+hqNa9Cpa5mSl8PM68XxyfYNAlN8omKeoyb+Wf5LCJzBWRxUobZFfwnhnLqWUy6dD4QoBjPNyJyvTdHe1wkk8TvB5GmvaLXJe4cF0Up/0CZXRQdVK1nyXnKFdd9KCdgJdSH+1ygLwVmVJJEOoU5nBb2n2WSvb5JDwdSmRiQ1uIVXDPDpp673scdlqn0e6XeEnfHYQapiUcv+/w+RbJdm29EmoDbtRKwPxgHuKnELe3JSAypPbU4lRsOK/DSRAbId4QcSGzrjfsTXJk5PsHd0o7yhFwE9hXWIHjti4o1WpEdybCKivgfdXZCAzMtOiAC0CPWg3q0abm+aByleyet/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jx7CRyyBksYU7DsZBMtVUusWFNV63KtveG8iipofoA=;
 b=bxjPUREu1UxZ7SYZCXcDnK/9/62j9AP22kLalGZUUc38abAjpboUZtZQ8WhtYnBzRxQKRFLMpWLcLfFYbeANkgW4WYycOy7YO8So2TV43x6htOV6t5ZDNmvLegnhwd0YYVXm4iA33paXa3CNTW6aGCUUGvmmywaBnjYhQQ3NJfo6mBxhRwwkuZcZrMgjTGLc93mMlg9ZWmwMsfac4mCi4FBT6zzEm0ValPozBpBrtg8jwrEkdFFXE9cbv1iq3/b5MdosBVSF8ylYaaYzL3jJ5YWu4Mq7+eeVJE6nVY1TN73Rc6rea7s9LNKCrLvbiOSSwzjlVzI7ubILqCbzcGzhSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12342.eurprd04.prod.outlook.com (2603:10a6:150:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 14:47:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 14:47:46 +0000
Date: Wed, 1 Jul 2026 09:47:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: joy.zou@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joy Zou <joy.zou@nxp.com>
Subject: Re: [PATCH v6 5/5] dmaengine: fsl-edma: fix use-after-free after
 dev_pm_domain_detach()
Message-ID: <akUoh9kBgHftuGeM@SMW015318>
References: <20260701-b4-edma-runtime-opt-v6-0-354ff4229c00@oss.nxp.com>
 <20260701-b4-edma-runtime-opt-v6-5-354ff4229c00@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-b4-edma-runtime-opt-v6-5-354ff4229c00@oss.nxp.com>
X-ClientProxiedBy: PH7PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:510:323::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12342:EE_
X-MS-Office365-Filtering-Correlation-Id: 7701c31b-a24a-483d-000b-08ded77fb6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tdRYZMW6ILNbCJ2XzgOMrJkkfU7rB8Rcy9osZVBTA8w0DoptP6wdz9ZRp3FXnOtG6TeRkb3FI/0b8STSIfrk6tdNOEIgkGLBdh53Tp+YS2ae3fZ2eNRJjjm9OTfsGcZ1667JDSY+JUyZS9OkwjrLbP0SKJTnpQ/69Z6qKH4ALDjRd4xGYX5jkmZI6/6DWMU5scmMTpXVlM5evGD94LDTncKyJHsemFCbpGyMn6ctZi8jBIP3kb3JeWNt8tDYMObihND3aTj/im3qqZ22AHCEb41m7mdQSLW1q7cuaeM10I44kSe02pSFXI3TORKFMxJBhwAZRNFRVbftvUEWA+lQSd/EdgipLVOYJ2om5WavBbRFSCVo9c+obXPsAeCoY4ti3WQUzUuZaWAkLTlcLkqwWGbtpDRyetBxlyo2PWgv7oUd5COrSCyQRGU0O8o1OwnUfYfE6f9gwA3qtOMF+lmyaQy97FOEcfronDiipq/JBcAWU5OfqtkySKTwHxoba0sPQNqwF51x4nRStHA6WlGhGaICyr+7x18vSepgT/hsVHlfeMBs61HxKECsEGWdrFUrKkenLqDEjkdEMShCs6RU9wRJNxIMzRepsm+OSokOS+RAD7H/Q58WNGhHlpo60rEF9CDhYM5h6/lzq6Kqf6Y+e2AuQmCt8UyKCojXzfEvl2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZTeOLfAOjwTdbUgyV8tcBmJEtd058IsfYtkIUL1Jirakm5ZZd2BIzupYfkxV?=
 =?us-ascii?Q?QF3v4I3BWZUn5xxppfHZ6ovmc02hpkY3R8ux9lYgaJGXt8icGgyOQ4kDJQcG?=
 =?us-ascii?Q?h2ATqtmR6mBs68aeigi7Yw6A1A1dRfB9MT9GG+0BFBs+30YOWhtc6hZymWx3?=
 =?us-ascii?Q?WwA8Kruow1PCaJTzUrHRfcKAzbUM6HMPgK6o82qEMhQtijJYBr1BXdJNuf8T?=
 =?us-ascii?Q?PqJ2fDxMQLUsOKre4l8Gravf/S36izUkOHdEsKiEvGWAo+utZMO7nGOYx3xO?=
 =?us-ascii?Q?n1UM69bmTRHRiJcvkwTRpPb8HT9YRl/3sGdirP2x5bvZRdB6WBZ25Ro9dbcy?=
 =?us-ascii?Q?XiWxUgyg+pLp6c5WoHfm+gUY2SMTci4bk5w9A7r3+amY/NRd0eKtRwTqSuxc?=
 =?us-ascii?Q?Un8qUIkMhSlJB4LsfCZ/mBwWShNnI+hl58MLuQM7TVL/BDTyFnYhr1t1A9fD?=
 =?us-ascii?Q?fXwkPQjAyWqhzVKfmyRGSwaGX1Vuajfrhr9Yc4RHqBB4FkzGxm6PL40nKRTX?=
 =?us-ascii?Q?ssdQiY/ZCU+icCeoKOxCObLdKulJKJ4E7O4IBqAp1tDfad6aevx3EZnnQKTz?=
 =?us-ascii?Q?XEe60ZuIJ1UCPggAU7n5vkdRmNmI+/WTRMrLdmxMuNNjTMj/gWE3KJIYbbMA?=
 =?us-ascii?Q?Gn8ZiEOJHB9379k6oDbI3tr0MMm3ZYj7GmeRkSHG2VVVuD/eDOed6GPoG3xM?=
 =?us-ascii?Q?MkeOEygHfFlcpjTz3NQAOf3yPK/H/2xMDMR7ZTvVRXaFggywrMCSQZ6e+M6W?=
 =?us-ascii?Q?V9ddCx69Ff8Tb+88kvzg2IpYl9jrFIflJWhMTFBJFQjO3CCfxO0ihNgqgLeL?=
 =?us-ascii?Q?WjRa0gfGWVPFiwdB1HrHxlj3X7J8Vx9i3a4v0vxgyb+xaUdHns78kPqi5DcB?=
 =?us-ascii?Q?Jj2YmpnIfO8q+az6ZNpbR9vh3Gf8ifbyFBDo4PXobF66blbl5hjbqyDt8M+c?=
 =?us-ascii?Q?4tVRPRPvpFzGEXDEZwTCFlVL9g45FL9AgNZTCbcb2ueVlTfjPI7JB4v63Dza?=
 =?us-ascii?Q?sA7HQsgW7KvmtABMAcoVEQhfyKEADTBs82vTG6F1jQVuiPOut8vCHDbIaih9?=
 =?us-ascii?Q?pekgcaN0npJ9mRQwdJ6+u+fxOm4DINHpyPUUiTL6BQKkNhYAH2LzM4nBRqGT?=
 =?us-ascii?Q?F17UPFTVdt7cU+8BM4GSrMZ8NLm/GPvvMPkseC+0UMkRfT+HiWDL4hphQYQs?=
 =?us-ascii?Q?GVwc/5GotGNLjDjHVnoJoJzyNOu7v87izq6oF2mZmC8rm8qRNp8PXlloAKad?=
 =?us-ascii?Q?7SmEBNv0cP2yjwJHlvW33TLZ1up3hlb4A0c6MAMkGXmE4CICoXF0ez7yxCOE?=
 =?us-ascii?Q?LWrgRVpfVrsi8aeia6qhB0Fy7VHwIqLSg5Nw0QPJz0OCzaOd6ql6ZxWOuxj2?=
 =?us-ascii?Q?31zfXihJypgQ1TVZcX+QEdMxKm8NMws3K/MfvHUKRvso1waRbiQH+SPWyetB?=
 =?us-ascii?Q?9pO2n0tlmOY0wXCCNyRkZGa7lPjcY60OyUAgXDqfYL+PfPpRvvurWXUx2wBV?=
 =?us-ascii?Q?yy6/wmREluMBH9O6agMzhmUyG3ysdn5PTmnmAmySy8mNW8LT2u5NOSpx1IYI?=
 =?us-ascii?Q?KKzW9+0AIDVf7Z8mizv8O/1sidFq/rJS2mJkmNOtt9UIQEQDmDl5XfN375Yb?=
 =?us-ascii?Q?GuKqTCKPzoM3ThkZhEOZb1UyfqlJqoNuQdG/qDb+0gX0Zx1EnuVvuid8cfKb?=
 =?us-ascii?Q?N8PYAbZxHMFBS2OTy1uWOwwIsgSzRwqTlnjfnyLdf7f9js/NxZoDJ74jWD/Q?=
 =?us-ascii?Q?bOKjWITypIG4XpIQPqHO3NFYCLZ+6gf7O7KHdhP+kfLWKRu5Cly2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7701c31b-a24a-483d-000b-08ded77fb6a5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:47:46.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDY8tx+d4USlPjNKKUX5vY7PKRvXYZQfw1XLqOvtSOHzvEtkorxFMXiYSOKFPY6y62HHkuQFDI1lThcb0huB0SzNPmP9PmtIiUcUP5wnysZuYUy0HKcUAWoZZEjrMe25
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12342

On Wed, Jul 01, 2026 at 05:29:27PM +0800, joy.zou@oss.nxp.com wrote:
> From: Joy Zou <joy.zou@nxp.com>
>
> Remove pm_runtime_set_suspended() call after dev_pm_domain_detach()

s/Remove/move

> to prevent use-after-free. When a power domain is attached via
> dev_pm_domain_attach_by_id(), calling dev_pm_domain_detach()
> unregisters and frees the underlying virtual device, making

what's means of "underlying virtual devic"

> fsl_chan->pd_dev a dangling pointer.
>
> Accessing the freed pointer in pm_runtime_set_suspended() triggers
> undefined behavior and potential crashes.

Need this paragraph, every one know that. UAF is common issue.

Frank
>
> Fixes: ccfa3131d4a0 ("dmaengine: fsl-edma: implement the cleanup path of fsl_edma3_attach_pd()")
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  drivers/dma/fsl-edma-main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 3518dfb4292d..266cc082a9f0 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -671,8 +671,8 @@ static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
>  			fsl_chan->pd_dev_link = NULL;
>  		}
>  		if (fsl_chan->pd_dev) {
> -			dev_pm_domain_detach(fsl_chan->pd_dev, false);
>  			pm_runtime_set_suspended(fsl_chan->pd_dev);
> +			dev_pm_domain_detach(fsl_chan->pd_dev, false);
>  		}
>  	}
>  }
>
> --
> 2.34.1
>
