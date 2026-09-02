Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB533438A9;
	Wed,  2 Sep 2026 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364087; cv=fail; b=Zx4BHQuCJWOCMeCYcYymDB/bTFJ/HweZElPJfp2DrucMBw7F4x0Om2LKNaBFfd5p8xuZ/Rn/FZE8vYPrA7Qi4fcpnzVdcwJCAVZ0X/pKLPFyuMKeOhwc84nyPTrmpCcnEgZeuWjzv/AE18FwZQ+eJELRjHkyD7lQcsa66XrLFVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364087; c=relaxed/simple;
	bh=F9XFVOHVX5xNj1CX1J5/1tbeP8LTJ4NVKIz6UO2EYgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eNBM1+rBOBInZBXbD0ugplbLhKum/RLnx3VKiV9O+oLsvNADuQCesZzLVxt+Cqtue1SlOG211cM5xFK3N33MLLO6oRxfXp15JqeOM2t5kqMSgN4irYS+Oxg0jWD59b0aHgac2+w9kEchNMLT/Et9TA2mQf8EQZ1/I0ylEjCSMzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lTTJ2wJf; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lTTJ2wJf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZAckbMK+/xecMdnoVZymAba8Ci0fBIBvDMry2j7NQjAok9a9vGRQICJ9gJPux6vEjRNoAtCYqbzcZYyXZxPPimrF4B6mtwoWjjmq2C5eVMYHEfw+VP+QFTb7MeoXXz3oqFiWvuzxHidwlSSDEshV0mqHukWgjoOAYB1JcxvzW8Ngc/bHfU5X50zPZJyqh0S464yaKeJ4FmGdWtbfi/l1rtJxzv+ZJBI7u8hWNhBxgFJBKFLkUZDhVdp7YVEbx64GozYiYgQg1+ecOjauF6lmSXgPi7lAmXRFA3DfN1D22QTaiSpOP19+S3F/p1OYyxqQi4lsxXfFI7F5DSQT+RYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpVxjIgh1sJ8siH4MabXOeI7ltH2TIrh04kKBHSBaFM=;
 b=I7mmHJGUdF4QC1BERfEo55bL3+q1PdZvUBfSJNTXzK6zGG/itQ/DpJDCDI3GrZwskVOBR+wIXyUKZGLKXgu91etxUsgN6G7XstOu/N3KeQ0DkuvmCLLq8RkAt/cBaOw6TKL5BqDSOXTEZU8z3qUaMenLX+viwRKk/QYh4DQmO3a2eQ9ne8nuKzDJfRjjsnh5MzRQSnpoMArOXt/NxAyb1nGgYiq+kL1gW5U8SbImebYxbnItuv9FvqaEI/mW/PwQTYfDy725tj+fYCQs6M4p/IS04EeeauVBgwYxIr278jvVV21WwrrXCYf4NqqSgynhCHDCcun+o3bTESdaVDTZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpVxjIgh1sJ8siH4MabXOeI7ltH2TIrh04kKBHSBaFM=;
 b=lTTJ2wJf/zD6XwEPZ5DB4eYnOcFaOZFNOnuBJhMTYZDlKvLFhrv1y5VIyljpDMgzrix/fW3c9kC9yjiZBFxHu4t55dl6c3BqsaHf2ayexdywoq0BuJ566s/WD5AIMCHx7j/7jr70sKk/gwD/5hX3oumrUE2uNlyLzLj0fekbZIozfZnuoTgs0yogptxNIPbcej+yF9qO/v+qQ5Yqw4hj0/Gjdwb0D/J3czJiJrr5WnozIksrViv/OV4kxagnEUuyRQJS60dS2q3raLdiNRcKcOXewwuac2ZW4xYRjX4DbmbY3ZsKGTyXXe5W4hFi13f2OwmuGbAmZkC9+oUgDAT7kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7124.eurprd04.prod.outlook.com (2603:10a6:208:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:48:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:48:00 +0000
Date: Wed, 2 Sep 2026 11:47:52 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Sinan Kaya <okaya@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 32/34] dmaengine: hidma: defer callbacks via channel BH
Message-ID: <aphFKIkJXWCO5ixx@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <702687c28f440bf017c6e57f630bb65d22d3b217.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <702687c28f440bf017c6e57f630bb65d22d3b217.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH7P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: f6863f44-7c82-4d24-1c97-08df0909911e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|10067099003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Q6t7kWsbqVTTy5e9bxhdJNjKoUUnt/59zuPwOhTgGCKHCFqadYdotf3ERQ19E4liEBPaTOzByYvRiAuGibF8ganV35petjK76uefz1ySQKwgd9KSutvsGSzepD4ts+WRf1BonBtm5bTh0FqJzDzrgoqAgyRuWDyIAt9WH7ysxSQmcgLoFmJYGCE8w3A2Z4oFfjCMZWUr0XqnZMxmCpIhmM5B9ScVrNaGlueYmOST0XlJU9WB8WhsAlbNJRdD4TCGrcecSFQfhDq/Ki7g3RlnRa/4n04a32VoZtb/V7cOC1860ZYBfhyg+zwgxOfEOZz/CCPYWR7dHia6vRJqatbq+ea/0X5Ps0XdhtP8xZMQAyGVrLHmrNDQN7C4cHJqOdu31NdU9uq5emJQJvpwEeUNEz+LZ3c2HJ7s9wVzR4IXBs9+K9AnrosVldC8OV/QP20lBM/IGTOYik2AA6d6uyHsOovoaKOq4ltXJ6vtPbkPYYEgfAcmr1L5vJgUtc3MBRepN7/aYCpQkv+FCJbwE07CPscD6Pp/mAgT/sGpfq774PYvzRgWUsPXivf8mHoErK8GXVRore6pQc7ZXtEHO07grdexxxCMRXSSwWKD757Q5ukIjT/5csvsihQzRWsrdKMzRN4dlQzCfX63CdJuojdcfOGtnxuz+5k4BsSIui5Rz78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KGkYBUHztWZiF1RYl6AMK/EfJs58AbSO7gyz55aeAYaVw3bYlEX28xYQCA6U?=
 =?us-ascii?Q?wr4B6MeUNbCCWo1eU4hs6HkBa/fymH1hRqlfVuvP21TvEO10kngu9qtt/79/?=
 =?us-ascii?Q?SVm+DJy+/EVRnrlXVd5QvvYEBEFIK8Ezhl6tTtwpgy/MVFfo2qqN8RhjMl0a?=
 =?us-ascii?Q?ZeibivXnW8fz0zzFkogXpybc/dPEkdGfGVPh2OCXQXQWukxMRR6iYW2iZupE?=
 =?us-ascii?Q?lQ9KezfOdqwhOrZVGsyzhEHVNHE0OB2EMb9T39DibC9b8MJK0PyCNcdyuwNR?=
 =?us-ascii?Q?v+EDUph7Xn1l+N9uMWEoGvD8WhurvRZ26EdW4R8Bu4E/f6HE+5sxsYovV2Tv?=
 =?us-ascii?Q?+yrz4SiDRe5CDGiKLf5fZBP9XuHAhHkmZRsuoQiw+knSPBVzDHbwy5p0wO2g?=
 =?us-ascii?Q?4c3MpK0vdd+OI5+hKHyZjn747bqezYiPqUfON3e0yzcXULoKqsydBAyxX0zk?=
 =?us-ascii?Q?aWVKJBXMFOqXEMjJDTJlXr1Fj4ZFwKVzC/dU4UbXsNRjcPdzb0LmLtSD5bYU?=
 =?us-ascii?Q?vIowlILalFerFJ1myU0Swr5C6NQyN6YRBXldnuhLYGGzqg4PLDYz/mTmSvBe?=
 =?us-ascii?Q?kgqrNrC0Won49lEzlUvc3iFw/QWkUm3UBa+6AuXs76GJUSVtiV9TATMF2lZg?=
 =?us-ascii?Q?TWbYR3IFkHDTFjcyMMWp6DEDI5urw44LfqkDtxEgNpfUvt36m0U7tq31LShs?=
 =?us-ascii?Q?Q5PM5nQr9BlWUdvKOKvNPAKgwuVlWosdTeA+ICYHn4yVs63FowM4XZ0TTthu?=
 =?us-ascii?Q?M+Tu0J0DNHjsJmIicx0CYH0jsmlLThvxUGWLrcqoA0VbgusleKxzlHlX4Euc?=
 =?us-ascii?Q?Njt00TNsdwoqW+dJ+Z4f4cOCO1o3SZCrQAqcM2z61bRelmw98kKTCD8Cn1n5?=
 =?us-ascii?Q?xMW7Q5q2NMDkuHCMRJU9sM2WqfE82p9HNT+8yAC8clrHbz99PidtCGZ27gvC?=
 =?us-ascii?Q?+S+um9Pq8xLPUaDLEcjKexQJC3l3MTPwrx1AcucwySPYN6CStQZ8j5YwSEg9?=
 =?us-ascii?Q?HwsGaiTYXfMrYdn06krrJeQwYEnTJefpMHTIe97KPp8PzhEDDLo7U6DapSym?=
 =?us-ascii?Q?vUjP+GK6hv6yFAhJROKHn5VT0SCp2bkQUMYTeuUqHXSx+/B2QjZ3/L+KuxKZ?=
 =?us-ascii?Q?/GWhhGrER1e1OFHKvRq/eaNA9TiqwLmasZ7ewStlfKNPH3I5RqqkcQS7M/mY?=
 =?us-ascii?Q?YBwNYIhx6niNXJLPqlyKW2TUiYGB/dqHODiTfoMszB1v+XtXCKzkB2s5ffv3?=
 =?us-ascii?Q?vBTqArYNdumsUcChagp+vzb2DGt1EDmrWJGMveZW9DSvVtD8um4qJgsYTnje?=
 =?us-ascii?Q?6aHQq3FSr7QhSgjUXzUhQbX87A+0v6uyg6j2DB0JsaD4eyWGb8zFaRD+GxwA?=
 =?us-ascii?Q?gwlWnZihaLtYO3A6RPQr0FNchHkLMA4TI5gsJCpjgcI0UCmXHHDP/2khgGW7?=
 =?us-ascii?Q?b4+KieNn8ow8SWkk6tlquD8YwZQANfwX1Ym06leQ0VxipFg25jQutPRnsL2a?=
 =?us-ascii?Q?XNWWoI4/en5cPbma4ssI8SgH5sygfA/4bJD1DDxNhpa92ShpM1r1nr7ZUIQi?=
 =?us-ascii?Q?Jhg6bjJnAynMl7PnPPsc1I3YcxoL5zwyawOlO9bQ2x19gCSEcaRGpImcvgXP?=
 =?us-ascii?Q?3w8Ei1Kt6AqhXMgZX+q9S5/7LuuqfCkWqJY5uZP7xd2hU/EHj2mwaTf4HgYF?=
 =?us-ascii?Q?HY/Js4kbsYKl+jO2hZcNOTJMP1/fMBVe4wHXH+2jDre52S1vtyLAvJWt8di7?=
 =?us-ascii?Q?l4soPU0ARDFC9ecWHs5Rv43RZaFnN67AWWB+O5lITlBjHo4IfGtD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6863f44-7c82-4d24-1c97-08df0909911e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:48:00.6906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKw1RkPMiysfahI8UEqtwa3fZCx+0Rbu+d4A1vBHqbsOOQJIKsc7Ms40uqRj52WSqQVapSFrMfHp0R+aHo4HpH7juIpfrXJHR5iIeugZUD07pGd+61tCrti6EVV/4Dd5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7124

On Mon, Aug 10, 2026 at 11:09:33AM -0700, Allen Pais wrote:
> Move descriptor callback processing out of the low-level completion
> path and schedule it through per-channel BH work. Drain that work while
> freeing channels so callbacks cannot outlive channel storage.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/dma/qcom/hidma.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be21d..486a2c61a9fb 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -90,7 +90,13 @@ static inline struct hidma_chan *to_hidma_chan(struct dma_chan *dmach)
>
>  static void hidma_free(struct hidma_dev *dmadev)
>  {
> -	INIT_LIST_HEAD(&dmadev->ddev.channels);
> +	struct hidma_chan *mchan, *next;
> +
> +	list_for_each_entry_safe(mchan, next, &dmadev->ddev.channels,
> +				 chan.device_node) {
> +		dmaengine_kill_bh(&mchan->chan);
> +		list_del(&mchan->chan.device_node);

origial code have not list_del(), is it fix other problem?

Frank
> +	}
>  }
>
>  static unsigned int nr_desc_prm;
> @@ -155,6 +161,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
>  	}
>  }
>
> +static void hidma_chan_bh(struct dma_chan *chan)
> +{
> +	struct hidma_chan *mchan = to_hidma_chan(chan);
> +
> +	hidma_process_completed(mchan);
> +}
> +
>  /*
>   * Called once for each submitted descriptor.
>   * PM is locked once for each descriptor that is currently
> @@ -181,7 +194,7 @@ static void hidma_callback(void *data)
>  	}
>  	spin_unlock_irqrestore(&mchan->lock, irqflags);
>
> -	hidma_process_completed(mchan);
> +	dmaengine_schedule_bh(&mchan->chan);
>
>  	if (queued) {
>  		pm_runtime_mark_last_busy(dmadev->ddev.dev);
> @@ -203,6 +216,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
>  	mchan->dmadev = dmadev;
>  	mchan->chan.device = ddev;
>  	dma_cookie_init(&mchan->chan);
> +	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);
>
>  	INIT_LIST_HEAD(&mchan->free);
>  	INIT_LIST_HEAD(&mchan->prepared);
> --
> 2.43.0
>
