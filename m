Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D336B4E8DE0;
	Fri, 16 Oct 2026 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166209; cv=fail; b=BmHk9EgghRi2Xmj9Vl9p5DbXBb+teI5u7rJ33N+MAtw039EHvf/VqPLbw5ZrVQpPmo7FrcGqmpJvz8utai3dc/DZqHIxlhRxdX98uQYPr19UNuHyQjx/xPEzU+2HzuAGDt836WG80BA+nfLPmJlQ3A+3qSsfJGoF3EcBMIRHQrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166209; c=relaxed/simple;
	bh=smWFxD6EoY1wszDOPe6XKG/Y94FYDPHX1vrclGpiZuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gw75XRf+7tJfMZ++YAuJMGAXepjloBtuk0PFOW/z+e7BPgmrFspnlNE9acOL+zS18eFdK8c/FnI5+4s6Ev06IVZEdcvWH/0XaUxIeTMe1xLZ+cW1wkeXOWAvSeuwiyYL5UXPVVMM3xI/AqTNeO81MyG01IZ7ponbNPITXYVz32c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xot/9NIw; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xot/9NIw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T61tI4vwbf9/vIDSD9zKHEePqH54yde+fhQeTT+jNEN8I8z4F5nYIDdIJuhAue9iRGtnh2g8Q7zgPAUd4/nAA5SGbwfp5So16p7E/dql00MScexqES5iaqoVrs5eFYp/oVplx67xp7OgLWaM0dkO7qyglHbhcQD+zzNMx0ZdNsgfiOle2jdBC4OACgqBQMhJkFghkDnU+JSJ+qEK77DeEBcYGEDG2NA5Mx+rH8ROPxQKQMiNf+jPtSLOJXPkNGV3nXvZklUvA6yIyz7UDEBExM3rlnV8Evj10Pe3DEF221SgE89843ME3DTA8dQ56s5WRD6jX3zCZCZeA0dV9PbOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSxo511YdW/EufdQ2X8JZsJI6HKqzAzvvV+EezNsWfM=;
 b=gg8J3vWivHe6UGgTME0w2+C5Od1oQjP6iLCbq+H69bEPblRHDAJmr1JiM+bpSK0hc34iiACIKVEwgdRuLYDZ1LqtqW5TC75xdqo7I4d1L00jRsceDbcSY6Ut2r6gaUrFBe3cL441ABAtQQA60v5I9YsAVdgmNlX9GQDNAbMGlNzz12YfsiznQ2wjyUhJSuokvI0P97SiTCBc+HAbmHhiLATS/UZ3+0tHw01qpWCrcM9cLfkZ/3fheoRE6kkvvncEogEHJiWWh88J/LbSzx3EeDLiNWAug+hGpkUlITm3jiFxNLJ3M7vyaMAPWANuv/tIiBJw884JDO2AgB1XaLtXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSxo511YdW/EufdQ2X8JZsJI6HKqzAzvvV+EezNsWfM=;
 b=Xot/9NIwThvcx/2MAadR+ETWXfLugPujQV/sjSXr8sIUFNgaicGQl+4w5kY1pDgMJ8xtz19tX6wxbSfbmhDAn773+fR7FAbcp4G3li04sK8yVX4WLpq1IDvFggQT5prY0xUXeYSj9DX4FkTTl5VT5qzhlyS7cXb8xsWGA9yFV0LVidOwMRoQjsluXlTO2cn4uLfbdeb23GK7hbAMSebRml1zwfTm2qUvw740jm10tnVC6Mz0f2maD6d960UQoDAPqTN4QYkx8XMfZPQPo+z0E4LQwCgfw9mLZLAF6Sw1pQ2d0tCI0pT0lAcjpPOu9Zo/PEgx0hi4ZatrSoJBuXdoFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 15:56:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:56:42 +0000
Date: Fri, 16 Oct 2026 11:56:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: correct gchan in error paths
Message-ID: <atJJNN-BfkgVGlZH@lizhi-Precision-Tower-5810>
References: <20260708-qcom-gpi-err-fix-v2-1-49c9be055501@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-qcom-gpi-err-fix-v2-1-49c9be055501@redhat.com>
X-ClientProxiedBy: DS3P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:45e::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7283d1-057d-4c5a-6bfe-08df2b9e127a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|6133799003|18002099003|10067099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	c/uArwt0zbQiVO9v+lfylu0953jqlBQ49WDUwINuAMiabJ/k/RFYIfmUEVUfuYLleWjUNE6/6sIQoIL/feCA1SkwOAJVCkB/cZWFdqqa+3DREMOymKkBP2tVKghNsWdX4e1ohX74NkeYJzPQZQuYubUrn5HqKNvbPa+CchM0gGYaw7tlDUc0Vt9wFbsJVHwvHNCDdlo8T9MEr3Vq/aFUdhTQ2r64BYwFVKuoDLu5Fp/gZBA3MTI1+UX3I6AQuiWK7WrQh3eWg8YMjD0TlsgwbczrZCtYMtU3kIg4W1QR/865j6arZsL8ZbVp1M3A7ndn+UG7TizSOb2AAZAtq6eOV3gNo43an9j64ZOS2SDWG+aeaj5Has34YzlCnjTjPDELxjpmWas7l6NBda2t8i5IHjkm8Z3ozeyh/VJhutIYYIV2wLgbUDe39Cn3bBvsTQe53llbb2m78YsA43JcMxdGcevoyzkjJQLgMgogk0wa7SZ0A/9SpgLb3vI7ie8VS2hq+PkFI58LdJhFGj3M2UD42Dgft1T/2+sZZsIbIVvhVqmuFhzBgOywCQuHgPmDGRKdAQmkcbukC9RQbI/1ekGdHcOjYmMs5W8Tkv3XhwCirEMwB/iH5k17F9hfcoSvuXRT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(10067099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8JRfyZfqR5cWpdu/4ypwZSxke6FWK+T39LDZHNUcicG+daC+aSrzf4okCIl9?=
 =?us-ascii?Q?UsTGQlW+sj6QG9p9fgTjBx83uhm/3CVxjnAmoIBvqN6JbLP4cLsEUipFmewS?=
 =?us-ascii?Q?0C61SmTlPn6jEDzxayjOwi1Rrtmi9CaOOJx+IFoE198A+dxmKCl9+iT6E4jA?=
 =?us-ascii?Q?+hDOV8Wilt8VIkb1DQE1/PQvsZaa2UraumGzMSSctm2BR/iFsWdHzRHC+StC?=
 =?us-ascii?Q?K0DYMjkh8S4zPJmFAbiQm5jwoIracmN8UewSh/Edoxw8tB0H0N2hAN580vjP?=
 =?us-ascii?Q?x7S+K3hW2V0dYvEzxTmsIwhFQ9edIkfwJOYxcF+QK1je06VK6Rha12YsQYJi?=
 =?us-ascii?Q?S+HqE9TjWL1fpU9rJWCB91C05e4AEqeh+Vl9LGv8ym4EXlumjiJe55Vnp30C?=
 =?us-ascii?Q?YJm76oP7c3Pjx6CBOugMvdeWGPOd4Je/oVRCuCTyS3g85o1L/PXuC3Im5UE1?=
 =?us-ascii?Q?nZ9JLtbGnC2dlAGn9SIx1SifuTTYUnlwoYg4dF/UqDtIQUI3Xd0RY5jzCT32?=
 =?us-ascii?Q?rjBqE7OXxrlGyDLzIGKcQdd2ESbtM7b3+qNiRkO+TrtYLtDTe0hyzVvOqhGd?=
 =?us-ascii?Q?LhwMqYq2H/l04G2ZwkuQwaKXf+/RX+VXbzR45VGQ62wS7QemN2zkt2deF0af?=
 =?us-ascii?Q?2AoYCUEqhu8PtmgtHoDtY1nA8Jbds9ED++CDsr/daPgHffsSoINFXVugyly1?=
 =?us-ascii?Q?yVRAdNW2O8SQux22xeekKNw375NzL+v2Yd6+JQS2mlhfUbUNxt3uSfPSp4pS?=
 =?us-ascii?Q?ONoilCTtb8/dOfk4qAr0aYZRz3Z3wkMbptcyO+aoMNUdi4jccL38+waku1Mo?=
 =?us-ascii?Q?HWhF46Sz7A3lOim5TKGS9gxbE0Mqj25MZE1uTBHhTSqImajUxMsBIZHnbg8V?=
 =?us-ascii?Q?vP7xERWdPygvm4ntKeYZMjG2f33epJAIwuoNwYBCalyudu5LPERPHh+3eIkN?=
 =?us-ascii?Q?Ru1+JK3qt771HE35lE5YwEg3H3CLNUH4+7FxnenrswgW+nHfBEpktrJXlCfQ?=
 =?us-ascii?Q?nOn/bZB8h8LH9bAXBYHQFHgfEz36ani3NnEiQiwS2MgMXDNkWjVZMzLaaBg+?=
 =?us-ascii?Q?cuJO2tfxiU5MflH+sVbK7Iiou56DvRQ/bB6relMv7ZcB0XtoeqLkQW4yj0Hm?=
 =?us-ascii?Q?NsOwLpFO57Sh96e+MyR+V6HT56zsBgQCR+1zupssY4tvO1b3NFqUf6pbxlyF?=
 =?us-ascii?Q?9MKTJPTOOR+ODXRif4YRzLgCSYp+MW57wn8wbbtvhQUOFARpOcXITa0L80P1?=
 =?us-ascii?Q?6J1bxZYkMqjs1z1JU2zTfJZJ4zrpQ0xyPqu8Uo9eaS5J/fFTmjIjEVEeqEyg?=
 =?us-ascii?Q?RcsvV2C4T/9eDGxkLLtSSxebasOGWg6ymQ/mPpWGPDZ4K59IGwxhfi6GXXLG?=
 =?us-ascii?Q?W5WJheerYCZeFw+pxJ3k5h5wxcKAdNyGjbk5vn6ULrag5ettv4WrfPpTgq+3?=
 =?us-ascii?Q?lk/e6UcxiHzLhXI49n/YU+TYWtEMJ/Qb7LSlcBSLnQx33fnUzjLOJ/rWni+h?=
 =?us-ascii?Q?GnM0hBNG+J9iCaNZpJAXzlNzck+jSI+Gq8aD+o3SEnqGQrNcFx5wW+APBWSb?=
 =?us-ascii?Q?eoNovU6+uCWVwVV+61pjF+7ensE1ul8w3CxzZzLGqIoBEezDom6Grq0bPsKI?=
 =?us-ascii?Q?SKXV5/883CUJd4enntKvIL6Lad9LZS8mSr1PpW9no8/DeM8Xrf8FOt2lFimr?=
 =?us-ascii?Q?xhWSmKFPmf84i1nKAIO+i1DIgJKdRIU2PTMHEuWwln4qcLzdrss2Ceoschyo?=
 =?us-ascii?Q?ATGQkGaI2xlFGjhB9cPiRj2joSo3p/JjyGVwcrmouWBSOvX6xkwG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7283d1-057d-4c5a-6bfe-08df2b9e127a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:56:42.6230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6l1HFycM9JRLGOWBXPhh6PYGduLRNe0CTs2cz3JT62twFB0cxkrSDbfwDMcNrkb6gSyr7ZWmCnViypFwqGkZQov6IXpOtDLjB2WvByEnHx0eqRdJtHVtNrUo626prYQT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688

On Wed, Jul 08, 2026 at 06:57:25PM -0400, Brian Masney wrote:
> When attempting to start the Fedora graphical installer from a USB
> thumbdrive on the Lenovo Thinkpad x13s laptop, the following errors are
> shown in dmesg multiple times:
>
>     kernel: gpi 800000.dma-controller: cmd: CH START completion timeout:0
>     kernel: gpi 800000.dma-controller: Error with cmd:CH START ret:-5
>     kernel: gpi 800000.dma-controller: Error start chan:-5
>
> Looking through the error path, gpi_send_cmd() sends the wrong gchan to
> gpi_send_cmd() in gpi_ch_init()'s error path. Fix this by passing the
> correct gchan in gpi_ch_init()'s error path of gpi_send_cmd().
>
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-6
> ---

The same problem fixed by

commit dd27c3f4d6108556b74b5f3f4d1d885269e7ffa3
Author: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date:   Wed Aug 19 17:09:31 2026 +0530

    dmaengine: qcom: gpi: Fix resource leaks as part of channel clean up

    The gpi_ch_init() error handling paths do not fully clean up resources
    when channel initialization fails.

Frank

> There's a separate issue with the graphical Fedora installer not
> working that I haven't had time to dig into further. I can work
> around it by using the text installer.
>
> Changes in v2:
> - Commit message cleanup as suggested by Frank
> - Commit title cleanup as suggested Konrad
> - Add Konrad's Reviewed-by
> - Link to v1: https://lore.kernel.org/r/20260625-qcom-gpi-err-fix-v1-1-5ca3f00fe2e3@redhat.com
> ---
>  drivers/dma/qcom/gpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af..3f390b5821ab 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1965,12 +1965,12 @@ static int gpi_ch_init(struct gchan *gchan)
>  error_start_chan:
>  	for (i = i - 1; i >= 0; i--) {
>  		gpi_stop_chan(&gpii->gchan[i]);
> -		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
> +		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
>  	}
>  	i = 2;
>  error_alloc_chan:
>  	for (i = i - 1; i >= 0; i--)
> -		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
> +		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
>  error_alloc_ev_ring:
>  	gpi_disable_interrupts(gpii);
>  error_config_int:
>
> ---
> base-commit: 6c94b38b83a04c43ea49004275f0391404051093
> change-id: 20260625-qcom-gpi-err-fix-06ef18453608
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>
