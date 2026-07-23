Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD047AF49;
	Thu, 23 Jul 2026 17:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826195; cv=fail; b=FeC7QAZIOPFaBuJEcquOS0TiUedrCcaqiJrCj16PjKhh5XPIXudgyiGKsTnqZWM05X2JeX1BydPTeaZ9zX+demYMPLjVRt80yVJH2eMc5cvkrBMULmaeppqKsKuHzEaLHtBh0kzQhQSlbYm5rLChspGygCuVseiTxj10sMXFocM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826195; c=relaxed/simple;
	bh=jpOTFt+lOvaZwK34YUJBbk+rpSYbvVZ30nd+wdPctwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IX6u3xynh+rdjlKIbyDDfhwD8SrKeIeNoy7f+2Xd5O6jOx6UtrHRVNwBD5jd3dz7qJE9pa0oFpVONxcr7Ln/UahWEzMzYBVeiZEpGbLLKG0bcxU/TsHnAX9fDqP64N+xWWgrIa/JU2rY5/oM4mBycAO6/BYpb34lNYSS1VEwAUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TCcvgFrZ; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TCcvgFrZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnxH/dg5Vb5qeQ+x+5YiFGTMRdc5Lahz4VfO2UGwX6NQvEvCvKSMnEPCXAl72Ci+g8ujDeGm97mmex4IYXnTrSvRHfFZzhTrHC9G0mJpBCauPTGtDkYXy64YfcE6IqNA2K9OrEUT9PbG/LkoHrThDENkEtr90hMtUHoUkI7l0Yr7o5xVMXG1AcvIGZLLluk0E96tGHXNRl3XRSipHDseEYzeag9k2TzvkqG44NBniRe1BCJWS7g0R7sgCIdNbZV3EQqU4NQMZeM9y0OEer6i/Ry1kj33EEMsXo6LJMwUjRPHyyGSh4nZuML308TfnVh0Cz1BBGuAuNtR4p7yT/CKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cv3ZKOxx381auX9MCUoO42AndhmibdPhWrCjONh693E=;
 b=MYgyPGSwY72k060fq8W7fNQD17ep4eAT6qu9i60U5WYHSEnFvRLehUZONJMd2R8BNacspDAL5YSmTiyOqf4j7YVV7WHP/K2TvO5BmguA69W1VOh8d9TPxMrRayNX0gHtAu3HCeSSf+Xm8mxtE6YyDg/XykgMrtke4/1P+DkGEIrafMDfkauGxR0CsR9BlQFgeYGFX8h/QXitUEr7Q+/CWY4FZbOo77bVY186iDtgS0zNGiUfMhFORcodz1j3thixiI3ljJaMvuVsYUBILKEEter403Btbjyp5BtbnY9IRg+AMitMCAUP1Nb7A5VyOyBY/cVHwsafTCphvVThDlcieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cv3ZKOxx381auX9MCUoO42AndhmibdPhWrCjONh693E=;
 b=TCcvgFrZdnTTveWpqMb8mKTtgyoNB4vdTFtxJOjy0Nx/Uvu14+/nXY0wx18llo8w2l5cNlmcF9ndoxR9FbBzsjMDAbdrlvut1Mt8wG5AH2cayAzhfxrQYac6su0Ezjr279H2jv8svRBIdGpNsDsp130SgXqq7lwRtlm4t0D8vq+V2Aj78jgKRCWbQhyvHP14VftIGVTsTWBBF5HfxBfRKe2siTy5jOG1ys+H55JLCSPJgdjjqMZPcoKf8JiF67yeR11Z3VIewoTN64WopU738wPNxMuwQegovsePiOL77kQpcdMXKrQ2XKqwgitmNVX/nh0eW6W/gfdt2+SNa5QZHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11713.eurprd04.prod.outlook.com (2603:10a6:102:51f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 17:03:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 17:03:00 +0000
Date: Thu, 23 Jul 2026 12:02:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/19] dmaengine: dw-edma: Centralize LL doorbell
 decisions
Message-ID: <amJJOA_CFIJ5wyyd@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-9-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084150.521366-9-den@valinux.co.jp>
X-ClientProxiedBy: SA9PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:806:24::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11713:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4d2ec1-3734-4b18-83c4-08dee8dc4048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|7416014|1800799024|366016|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RyYR/QHQ8F/B1JtlKRajDYaGzpmb/Yu5Rbken6D9tWFjXx/99IX6bpluRTFicxNjQ8JrMB+5H/nz0frGLK5JOOcuGb7fTXY9RaoLuu8Zsn6uUgmqzhF2hr26Poi7LxNh2SuApMiVjudRIdVRC3cBjuFcmwtFj/KR8RTUm1fsd+zb+5Cz9Yzw1HutqFQgPZsyQls8cFse7Kex9rEmxjrUa+EAJ44qmp6vb9rT3p04eKyBIteNuMRD30ImankVakb/H5sSsy7wEN/ua7Q+r0E8IrigyY17mFpypUOWI/D+XQz9954Q17BZPbt1b/2pwYyIeCVi/mMZb7O9k5QKq9+ccWSbmlqCCd9325apOM0nFg+gqx5cg61Sb363Mqw5vrQdadrMCgZTL5ETXeE1bTM+NSptVD8C1a1dbxuaN8XBHHVnLjvsN4kcWEgbax1p+GXxNBDTmw8M2akp5AVaq1ly9yzsYU+fHQboF+ROzLRs7FN6rgSAENmnKSNE/g5BHuh5w8ztOl0Im0H39XYWO8FvIUOeGTeP+oMI2+7BTnkRtouZBbnCJ3KixECDWV05ZJVAQaaKTEb7fou3LOUL7VGa2nXoimbiDwZQeVEU98E4ZAnGsMrGETLHcMoD/ThqcdMSp46iRK0BYjYwb8UD8gzslrkRS/gVMwnYM6k9ph5G/wU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(7416014)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LaFgzlomG0uoQlicbI04ed5S/I4TV5+pM4QBxSp7Lw4IKc93O6iMMGQFv17D?=
 =?us-ascii?Q?cO5Vn1P6+pB00sMG2WSxffu2UKa3eHVacUkesxAAh4D6OGoWEDa6xdxLNtZL?=
 =?us-ascii?Q?MaRmG2EV96X9baOI9s33pMwuvNl89sAuxX/M8oMgK/fdwovJXUdzG5TiZJWr?=
 =?us-ascii?Q?OmDPpCrBpEps0mpQ17kIp+dosie5+Tlea7NuTbn1I3MGTljkIpGWypVL2q2L?=
 =?us-ascii?Q?CDFCmqNqVUiHS8rOEvu1PY4h5JnXg+WS2CpNY0mRS7h5iEoHvoJ62hyGZ4XQ?=
 =?us-ascii?Q?3xdOT6pPHQWJi64eX+RHQVEtoJdZbM3A+/AScHyjqzg3ELNZH52fonNXyMWd?=
 =?us-ascii?Q?FMYKT+ebXVKrO3h2JAGThwSd6JXDI+jeMe5KKuZJOTUMjFkPbGhe9AcmAi+4?=
 =?us-ascii?Q?54E45sqSg75kBWEm4z7qy6CJgQOofHwdAbkpGHBE1w18RpAZ3jY4b+SVOJkW?=
 =?us-ascii?Q?zQdT0uQzJ1FhFDW0+QRCf/q4IZAqLfWAhEqz5GxH86MygvsPWc5ca+2SeqN6?=
 =?us-ascii?Q?GyT9Hfpfun/VnPkPhlVpPpZL8VE12O311TewPnY0Wit9LE20mEw83thA5EjT?=
 =?us-ascii?Q?L/B2zmI97U9LVbdLadJAikrFDqaiAQjI/WiWHGqGIYOXR7OCfrF9egJEl+cP?=
 =?us-ascii?Q?fH0oLzbSe/hRc+Sf4NNc84LcyHl2LWfLaMjidtoKptcj812QJHlc57gWa7df?=
 =?us-ascii?Q?wepOzGrXNTSq9J0b4e0MtANk60wR85nG98jvMc1UMBLiz5NFcggHQEZMaOP/?=
 =?us-ascii?Q?Mj5kqJlsDkIu8F3k5en0b60e1ia7zBjAX/IkxiDkqiD8b0QMl2U8gi1jo9G0?=
 =?us-ascii?Q?te7LqcivCjGlDw6MTnevmL7wH5ozCh99UAlD6HhOruHfjwWbEFruh/2xXxib?=
 =?us-ascii?Q?ucJUqSjivTIARVu+SC0H9XAOJ5BgBwz8ONOtKX/6gd8zWVNTdJofWTBD3aGu?=
 =?us-ascii?Q?YxZNZe4L2EX/+FgtNvh2VCIrQm9ZmCG4tnMcdWfD082MovtQ0XvKwku3bsii?=
 =?us-ascii?Q?lqWL+0IjMBmjzqnoUHvdITMUVNr5cS4hX9DUKc9n4nKRgJupwsmcyC+NlJ0b?=
 =?us-ascii?Q?6oRRIn9ikaWjXOFBUyyyfndRmy8q5eEq4gDS8doWN6mFb5/iq1/Um5Y/ZiM/?=
 =?us-ascii?Q?Vq83fx3pNQnpDdYeXAq6EpzTuImrl7SVp+nISdi8WdIHJF38TH2Fqdjcrfwk?=
 =?us-ascii?Q?9wYC7KuNujj9AQnnXFNwQGAy21bIRbkB24wjpP2bwdLKc4jDYnBLjMaJRcJq?=
 =?us-ascii?Q?V0HvAsLdIOtEZViJTCuYtye41ISNJsJlJOMWCYBa++3K4ljTfKo54RHJEqLO?=
 =?us-ascii?Q?sTgj9us6+/b20vADx+jxgQbNh3+Qzfkq/dwshu/lMT8Ax2rSZ1F82Wptakc8?=
 =?us-ascii?Q?lm9J25C6WZesH4nVqL5X5IauS2C5fWUYdXe/U2NV/EqJykNxLcQB58zfEEw6?=
 =?us-ascii?Q?FnhexGCV4mJveRkyJ7t2guZAVq9MDuUKD//jLk8KqVwdn1aeiDc8MUfpEYIb?=
 =?us-ascii?Q?UGNCX2FbCtlxIZBLsnbbbHh8j0eZGWo1k3I4Xbv0+CsZLZrPFxNTSKscLRfd?=
 =?us-ascii?Q?XwO5lqGGqzQvnlgITF7Ax4WHGlwg16xXwqj5UdAPjbQy4rIZNqRH9cyms5jq?=
 =?us-ascii?Q?Uuke7+/fru7Z7/C4YSLKKL710r5d+hWvyHZIKreLSwt32ChABTnzhIyZ20Wy?=
 =?us-ascii?Q?Jzqt0cnQ2CqeQUQfxPQ3ie1676ZaTGYagcsCLvh9+feQrVm84IUUwoTo0jpc?=
 =?us-ascii?Q?OiutQ62Q+xzSHFh4+4HIOC8xl20RJOOqowvW9/CYYyXFMREGSAfW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4d2ec1-3734-4b18-83c4-08dee8dc4048
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 17:03:00.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WqjAWKMtm03iT4Zs+r9mmCLmLtQZlTZU9WTK+nsHt/Zx2xKoWBAmMMZ7B5Bly4eXYfE2FzrJlEjQagS+J4XWEwrOVnd0QfegRLxCviIKagknHEvIWeLD1fVN+LAskHp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11713

On Thu, Jul 23, 2026 at 05:41:39PM +0900, Koichiro Den wrote:
> LL fill currently rings the doorbell every time. A running eDMA or HDMA
> channel follows entries whose CB matches CCS without another kick. A
> channel stopped at a CB mismatch needs one.
>
> Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only for
> a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
> EDMA_REQ_PAUSE, and hardware that is not running. The BUSY check prevents
> EDMA_REQ_STOP completion from restarting terminated work.
>
> issue_pending() still publishes LL entries only from IDLE. A later patch
> allows live appends. Non-LL channels are unchanged.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - New patch.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index fa104af4146e..e88bfb417ad4 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -129,6 +129,11 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
>  	return desc->chan->dw->core->ll_irq(desc, i, free);
>  }
>
> +static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
> +{
> +	return chan->ll_head != chan->ll_end;
> +}
> +
>  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  {
>  	struct dw_edma_chan *chan = desc->chan;
> @@ -163,8 +168,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>
>  	desc->done_burst = desc->start_burst;
>  	desc->start_burst = i;
> -
> -	dw_edma_core_ch_doorbell(chan);
>  }
>
>  static void dw_edma_core_start(struct dw_edma_desc *desc)
> @@ -232,6 +235,23 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
>  	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
>  }
>
> +/* Must be called with vc.lock held. */
> +static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)

suggest this function call dw_edma_core_ch_doorbell()

old dw_edma_core_ch_doorbell() rename to dw_edma_core_do_ch_doorbell()

Frank

> +{
> +	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
> +	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
> +		return;
> +
> +	/*
> +	 * While running, both legacy eDMA and HDMA consume newly published
> +	 * elements without another doorbell.
> +	 */
> +	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
> +		return;
> +
> +	dw_edma_core_ch_doorbell(chan);
> +}
> +
>  static void dw_edma_device_caps(struct dma_chan *dchan,
>  				struct dma_slave_caps *caps)
>  {
> @@ -357,6 +377,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
>  		chan->status = EDMA_ST_BUSY;
>  		if (!dw_edma_start_transfer(chan))
>  			chan->status = EDMA_ST_IDLE;
> +		dw_edma_core_ch_maybe_doorbell(chan);
>  	}
>
>  	return err;
> @@ -405,6 +426,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
>  	    chan->status == EDMA_ST_IDLE) {
>  		chan->status = EDMA_ST_BUSY;
>  		dw_edma_start_transfer(chan);
> +		dw_edma_core_ch_maybe_doorbell(chan);
>  	}
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
> @@ -720,6 +742,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  	default:
>  		break;
>  	}
> +	dw_edma_core_ch_maybe_doorbell(chan);
> +
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
>
> --
> 2.51.0
>
