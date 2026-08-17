Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130433D8132;
	Mon, 17 Aug 2026 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975553; cv=fail; b=lbu4oDWPnOLwbleniIE+Jqzxn87PUgrDQZTcobOrEcSL/YMVVNj2BkylYooIgKBxggYXFhyyE1XQhL/4uUqEdjTPWORnZQqYv9O1ENj537jTvWJpBksHK15/3oNuAm6HAnIKhdky0EiMY7TdJi+BEUz2J9lR1pZXhhQC3yejcDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975553; c=relaxed/simple;
	bh=mEHZT6zwN4dBgVLJ1VvUzhol64zAKGmOk/mSPP9waAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SArtD3zMiwaV4zVCd8nwHp2hKn32qIv8E3H/NLDd05EOUYsPgXamIM67409pOsm+rkvRTp4Vs+RZyP/fisMpOdKpKmavMw7srrxNvpnB7n9MyU4ATZaADmR5lE/ej5xjnaMDPU8grzXYJNKdvJwcURSWpmc0qLQ4VJhhmDMB0u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MDViLpQ8; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MDViLpQ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdx+XDG4cFAK1Mo7oKVdS1zauxAlkGYLVUlDoJmQKn+EC3Kb1yD24wC3yf+s2WpH/K7eO1ThCJ+wUae6upG7u+yTHjIYQj5mKmi0nmz9MXDTJ0Ku/l4W8O2Iv/Vpb3FZQTnbc9ikLnyj68Niviiv3oUVxXwnnktnQiUons+dFOIKSlPFxl3RcnRd74lK0+ABnLR+UzFXov0lJ5dFHvujKDd7dPxYF55FYm+unRG9DuS6Y+Mi3H96P4b8EiuijwXf2GU+KkqhGArzRIl5HzTGbs9B2tWchYXvsfX6pr7dJAXJKPLll5K0VmC8CkGsyzg8ehGqxI/cQviQEIiHhoaQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQLvIxYQgJ+BTBFBVOWQWOMIVM59F/pZhMxEOdVR7ok=;
 b=rlbJB8pTV1UJS1VEtdVKgOjH73l0+2N02RRYPZgMj8JD7x1d0hP4RM8QWxGmKe58cwmeugjh347LpmRE68TVmdgPbcDLehEGUODkAuyFrV3mn8AUv6+dbD8C3qdQvDk36RfXR9phKg8X5e5PzzUZ0///SwF5f7KcV2vX3dIJ78utkSSMSf5wZ+xL4CKAiddFsgTnj5jPrdPBqRu8OOf5Hxc2nnH0jwyMYedEy/hOQFyrxA0cuvrDu6W8bRf7AKjo2tmVwfUChNAVhIpxvjcYjLmRnsYjPcHRrH1qcVUxjsDKuOi0CLi963R6eQs9D99tliJonsO/fgUF4yyfdfzUbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQLvIxYQgJ+BTBFBVOWQWOMIVM59F/pZhMxEOdVR7ok=;
 b=MDViLpQ8qrCu4LqQYGv8jYK68JVgFs297TD4G21Q8dd3R/ExW9IxFohbUvvQm6mXYqQY7c0jA2KOr+X0PTfxLh6IivdcLpkcDGWtb3x89iRXznIzcDzXbWLqY6czKIVtfjz6JBV4xXMNpczKW+3yEO2D/UoCz0d3NRFmROH2ajDh/U/wBU6S0lXAQljWiHfXzC7zqHTLEOZvt5i9M5V/TuaskXMsEwCqikRJHZh5CpHCf7/FPU+et71miSIwyzDRMULdRsTPxJpNk5q2YpV7pky8sh9x/RQ7lFDWOMECt1mE1BX0LJUgiXLakpbcydQ3h+zih0PUGCmSrXSF6t1zTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11192.eurprd04.prod.outlook.com (2603:10a6:150:279::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:05:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:05:48 +0000
Date: Mon, 17 Aug 2026 09:05:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap and get irq early
Message-ID: <aoMVMvGvELugkRiP@SMW015318>
References: <20260817004500.59251-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817004500.59251-1-rosenp@gmail.com>
X-ClientProxiedBy: SA1P222CA0082.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11192:EE_
X-MS-Office365-Filtering-Correlation-Id: 391ca022-72a2-493e-35df-08defc68a368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nPLuL0XiYZtDxZAUzbXj6i6UouPv9zFGN/7eLTNLQtdmLVPqKzZzXXAs32v9sn/YihmFFTZQfPaWVjraycVvXlx40LQSFEYFV++PXv1b6DdwmGvfnVeFtC3xOzttBuvanAMcU62qkJ8bTjUFswF7yfO6oXVDec0kUEEtTeYZ6NLrccNLLXv6QitYTVOlfk0bqMN8dDy+KY/bQzUm3ejBjfUL4Tp8AHtCSuMmrh8IA+j1JdT57Zg8M7CdbFidNNBN497em0QWF6e+hYDjBeNaQHVsnMpG7VzDgigsfL8TTtIYM7TRxUFa3LLBJTD8WywNScop0hpWalpNsl9TC+YBA+iV8DHgjAReWILc9C3STmBVkLcQC0RRs5DBgwoqVcRhdkB5kFSUsp89e8+pVoj1Fh4IbWIBgbeP7qMaf+mSsTd/YMATRoBaDrjZVwR6/2sJ1OIyqsowdNcLcaaPUsc/9LcvYVF/ouPA0PUdqn+p7zsup7pBzf7C4xF/0jv44AzObsYyZcFs2jrYm1QCPI+/gzMHOEpI0VUqy60Pc4SQ9xJtamQeD9y2/zWiLpqP+MiYSY2H+gBaaRT8h6nTBqSlgC/hBjRxhuXTqRLVAbpX7hAtWqABH2SBSYI6wkpJGwD6QmNh6tnqAV3U/jKnWSRnXH1MZjsZy7XDQ6AXTt8XY+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3lynresbXs/8fdnCc3agVE9HLc0xuRP+wY9SYPlLwPAdqdsTw2qoyWx/KobB?=
 =?us-ascii?Q?lvUdFXv+KWAwFUW8aXdFChmyjefloo0UU7HOytvFLKn5sAFAJ1UDclaLl3jC?=
 =?us-ascii?Q?2LPPyzx15sv7bUgNfaKO51eWt2rpRrw5AWhC+InoI87yJbSt7Z/qMsrZ8GUF?=
 =?us-ascii?Q?pJk/vGCs4UcixPpC9wlwgPMnuzrIDyLeVoRD7sgz1vWE0cvBy/s2P6+/hBP8?=
 =?us-ascii?Q?T2z4f1EtUhzJcWN3gbYCMq3INYUiVuiQYb5aSjOiRFYwdQjQY6NaGgGjjG1V?=
 =?us-ascii?Q?WxkfK6oObjH4kUNeqZi2awxWUbQARjAwwmygUuTcluKpozlP9PRanXwL3s1K?=
 =?us-ascii?Q?gQ7UtAw1QAQ3uIlNKKvrvNUEuVtdAQ1ob1r27mNGwEcLzQHejqLaA9U0Z3AF?=
 =?us-ascii?Q?18xX2S33nkx0tMDGg3kjG+qozC57kzt2WxCU03XotdkD9WLjEpXKUcmG159n?=
 =?us-ascii?Q?3vcdHxk2wydaERKGpmXuZWvSkPYG/RdHaq8hkvYh+JSJ0Iu34G18V+zjZDi7?=
 =?us-ascii?Q?U/mZiljtzTEQabbB9pSF73Gy7PnDpIqYIHXjrSVYab0nvxcsWqk5pwP1juC+?=
 =?us-ascii?Q?MiUMdRCr8xc3kGCzfYbsUoNPWrPLUHlhoDZVkMPzrMhxvjm/EzixoqIZ5P9G?=
 =?us-ascii?Q?2jGnQvcdhjLcw85fNw9OXeHm2i7QY2ijWpXPK0irsVvWxkVZOFmiHPMpfJiT?=
 =?us-ascii?Q?jmsSzJKnWJhQ6HujShsG+XM1rildtEEnokcVeQWbmMYN8PUH7jmvE0AvHkaQ?=
 =?us-ascii?Q?UJnScwQPJiRFAOI2z9slugTE4I0de3ZFdjrVccIW7BOKB1ZNXt1BN+9yo9x7?=
 =?us-ascii?Q?l/kxX/Rpkeqz6XawUlvcQyLeTfj2tlda29Ri24figFI+DO9oel3N5npqocDu?=
 =?us-ascii?Q?HrIOv6wqRKDxk/gfRIDSeMyeBz653O7xNRPjgxPoT1Nq0D8bwEZufg3Tyynv?=
 =?us-ascii?Q?7NDBYylMX9Q5qkSfIMX7SCbmRkoTN9mj+vawDjz+xbwdL4Ed9gBpbpXsG+88?=
 =?us-ascii?Q?tmdwoV3wbzr1iI46oLEERVaiyls83bqjMMPUWrH7vW+6srynW4VqwfIdk5Dg?=
 =?us-ascii?Q?YOkTcC8JGDRyiuLrFAZ8IkXT5k7rJakWClhCB9QG6uHDDVDNziaQcB8OkDOZ?=
 =?us-ascii?Q?nUHAAGPpe3+xYILszpMnB6SOW6ZAKfKGA+yAp+UxuATAFhLnC7KWoB8Ro6S9?=
 =?us-ascii?Q?s11zW6SCTUfdJg5/cRnPemMKY4wPufsuARkKTSdVKkv12amo1dmBRRSFmdEs?=
 =?us-ascii?Q?Cl8dkSKEqoXLPMo8ii1ZuZqdSfVjuC9Mv4CdDn7iKxMIANcBdOiyk7cze5wE?=
 =?us-ascii?Q?fGG9JOP1xRzlneqaoZvoKLY20o3amIIl/5ifeDoISKXBxCWErjWLmAodkO7m?=
 =?us-ascii?Q?GnL0GITvEUVk6RZtFkkrm6qnMTaPOE8EajI+Cv/jcbq+hNHpLPVGxW0saYlw?=
 =?us-ascii?Q?0K80W/kQH4NmLkmi+8BCXoi3UUCqEeIR6fRTisnNM3gqtCYGzR+gc3HGmzao?=
 =?us-ascii?Q?IAEjBB5A7m1X548WS11MimZq1o/tFXuc7xNoO3GTbuZ4faeHrzk8e1P8SbQn?=
 =?us-ascii?Q?LdAkyhKKiyg4It7ad26hI8g55ZUL2QxoBcBueb7Rp8ISXTieQtinSidkL7aj?=
 =?us-ascii?Q?wlnUzb0AKq0Rpca1tVQL8KwHWbTUI9ml06kVhVhnHTPNcYpHDlOgXQuJXN+3?=
 =?us-ascii?Q?2oPkddH4KOvtsVodkpk+jiawyJcl8YN/34gMofXfXI2qL/nZvJ1bDBMb04s+?=
 =?us-ascii?Q?DOU4NPbNQoRO4zQHkUSvlNlPKqWxiMqCbqoe2lC2PYep2IkcMl0/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391ca022-72a2-493e-35df-08defc68a368
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:05:48.4293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRWe6KsY8rwDcPOV4GztEFtl/2dI9FZxzbE3xJSLDUTDSG6Tjcxm0obyq8t9ZYOPooMKzVdCT015+QVt3yaP+rszOgtG2t88TLVslWIwDyyoFGfOoNbicvdP5zqYFh1m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11192

On Sun, Aug 16, 2026 at 05:45:00PM -0700, Rosen Penev wrote:
> Doing so allows handling potential -EPROBE_DEFER before any work gets
> done.
>
> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies the driver.
>
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: bestcomm: get irq early

make irq change as seperate patch

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> platform_get_irq can return -EPROBE_DEFER, which is useful to avoid
> doing extra work in such a case
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/bestcomm/bestcomm.c            | 70 ++++++----------------
>  include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
>  2 files changed, 18 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index 432b43520ddc..55ad7bc34df7 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
> @@ -48,6 +48,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
>  {
>  	int i, tasknum = -1;
>  	struct bcom_task *tsk;
> +	int irq;
>
>  	/* Don't try to do anything if bestcomm init failed */
>  	if (!bcom_eng)
> @@ -68,6 +69,10 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
>  	if (tasknum < 0)
>  		return NULL;
>
> +	irq = platform_get_irq(bcom_eng->pdev, tasknum);
> +	if (irq < 0)
> +		return irq;
> +
>  	/* Allocate our structure */
>  	tsk = kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL);
>  	if (!tsk)
> @@ -77,10 +82,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
>  	if (priv_size)
>  		tsk->priv = (void*)tsk + sizeof(struct bcom_task);
>
> -	/* Get IRQ of that task */
> -	tsk->irq = irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum);
> -	if (!tsk->irq)
> -		goto error;
> +	tsk->irq = irq;
>
>  	/* Init the BDs, if needed */
>  	if (bd_count) {
> @@ -102,8 +104,6 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
>
>  error:
>  	if (tsk) {
> -		if (tsk->irq)
> -			irq_dispose_mapping(tsk->irq);
>  		bcom_sram_free(tsk->bd);
>  		kfree(tsk->cookie);
>  		kfree(tsk);
> @@ -126,7 +126,6 @@ bcom_task_free(struct bcom_task *tsk)
>  	bcom_eng->tdt[tsk->tasknum].stop  = 0;
>
>  	/* Free everything */
> -	irq_dispose_mapping(tsk->irq);
>  	bcom_sram_free(tsk->bd);
>  	kfree(tsk->cookie);
>  	kfree(tsk);
> @@ -365,23 +364,24 @@ bcom_engine_cleanup(void)
>  static int mpc52xx_bcom_probe(struct platform_device *op)
>  {
>  	struct device_node *ofn_sram;
> -	struct resource res_bcom;
> +	struct resource *res_bcom;
> +	void __iomem *regs;
>
>  	int rv;
>
>  	/* Inform user we're ok so far */
>  	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
>
> -	/* Get the bestcomm node */
> -	of_node_get(op->dev.of_node);
> +	regs = devm_platform_get_and_ioremap_resource(op, 0, &res_bcom);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
>
>  	/* Prepare SRAM */
>  	ofn_sram = of_find_matching_node(NULL, mpc52xx_sram_ids);
>  	if (!ofn_sram) {
>  		printk(KERN_ERR DRIVER_NAME ": "
>  			"No SRAM found in device tree\n");
> -		rv = -ENODEV;
> -		goto error_ofput;
> +		return -ENODEV;
>  	}
>  	rv = bcom_sram_init(ofn_sram, DRIVER_NAME);
>  	of_node_put(ofn_sram);
> @@ -389,7 +389,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  	if (rv) {
>  		printk(KERN_ERR DRIVER_NAME ": "
>  			"Error in SRAM init\n");
> -		goto error_ofput;
> +		return rv;
>  	}
>
>  	/* Get a clean struct */
> @@ -400,37 +400,14 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  	}
>
>  	/* Save the node */
> -	bcom_eng->ofnode = op->dev.of_node;
> -
> -	/* Get, reserve & map io */
> -	if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't get resource\n");
> -		rv = -EINVAL;
> -		goto error_sramclean;
> -	}
> -
> -	if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
> -				DRIVER_NAME)) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't request registers region\n");
> -		rv = -EBUSY;
> -		goto error_sramclean;
> -	}
> -
> -	bcom_eng->regs_base = res_bcom.start;
> -	bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
> -	if (!bcom_eng->regs) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't map registers\n");
> -		rv = -ENOMEM;
> -		goto error_release;
> -	}
> +	bcom_eng->pdev = op;
> +	bcom_eng->regs = regs;
> +	bcom_eng->regs_base = res_bcom->start;
>
>  	/* Now, do the real init */
>  	rv = bcom_engine_init();
>  	if (rv)
> -		goto error_unmap;
> +		goto error_sramclean;
>
>  	/* Done ! */
>  	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
> @@ -439,15 +416,9 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  	return 0;
>
>  	/* Error path */
> -error_unmap:
> -	iounmap(bcom_eng->regs);
> -error_release:
> -	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);
>  	bcom_sram_cleanup();
> -error_ofput:
> -	of_node_put(op->dev.of_node);
>
>  	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
>
> @@ -463,13 +434,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
>  	/* Cleanup SRAM */
>  	bcom_sram_cleanup();
>
> -	/* Release regs */
> -	iounmap(bcom_eng->regs);
> -	release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
> -
> -	/* Release the node */
> -	of_node_put(bcom_eng->ofnode);
> -
>  	/* Release memory */
>  	kfree(bcom_eng);
>  	bcom_eng = NULL;
> diff --git a/include/linux/fsl/bestcomm/bestcomm_priv.h b/include/linux/fsl/bestcomm/bestcomm_priv.h
> index 3b52f3ffbdf8..cddde7c74cb5 100644
> --- a/include/linux/fsl/bestcomm/bestcomm_priv.h
> +++ b/include/linux/fsl/bestcomm/bestcomm_priv.h
> @@ -66,7 +66,7 @@ struct bcom_tdt {
>   * This holds all info needed globaly to handle the engine
>   */
>  struct bcom_engine {
> -	struct device_node		*ofnode;
> +	struct platform_device		*pdev;
>  	struct mpc52xx_sdma __iomem     *regs;
>  	phys_addr_t                      regs_base;
>
> --
> 2.55.0
>
