Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013033.outbound.protection.outlook.com [52.101.83.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CB048EC6F;
	Mon, 12 Oct 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817773; cv=fail; b=o762Y/0RDgunVyyTj5MvnBglbAH+e8B/cg7CjhljqwGg2keJYPuyV8WkrCO/qHzK3Pcgo7HiUpP6uMShTuFd8alPjFT/fYlQ/3MIne5usQM68zvQe6EinRbA/C5GwHsJ5cx0UYS3pc0X8ekw2Ejj1S/5BZOKbwPh27SPwy6UmIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817773; c=relaxed/simple;
	bh=BdT45RatjOTytyJHEaTQmirvQ7jAuCPore+s096Ak/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c8fs2+zUr3JyCR0uk7u21tvtaPkuA8hBFqgdxBOcssegSRIwxluQx97d9QXl8yXT/uGg6cUH54zRmGLGzvUfw8rDsZzNJn/E4NRT6ttRHZ3ixp38MZw/sAKE6ZT7hGmnISimDBZqECThVs2pgbrnlCWzv10PbDykyg8hmoXvOQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RUKx95dh; arc=fail smtp.client-ip=52.101.83.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RUKx95dh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy+2jJ1ga+RNMVUjZzO45qjETVn3YsBwXta25FXzrKWLkyCGH15G7ONzOOs8bU4tuV5wZZL6KeYL9SmIMu4OfJEq62+1l9H+FWSWEYGLOFJ7Q13z5qBFsvtOnIK3W00jf1eGZLK+3gsqSFLTqqdQoyJLvu19CIU9atef1vLLyJC6v4GwSBwo9pkbQQnQky0v1LSAr4jgTVMpR5ryBO4RiIyW7Ni/rBdi5NM7pxNNG5hm4FoBxMxE9vUQgKXznNK9GU5AGqYG3gJ1F1BtUaR1ZQFJkgWkVk7McyQVCRvTddfFvFgMHwWFYQ1PGyQq/E/XbCE3TnEQLrn/bcsppG+Zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UD9NlO1NyCUCM86zdc7PC74SLl7CAhWMA8JrSB7uTY=;
 b=fNvLalqLstVodibOmuc7lG280kCASbNXpiItjtt/x3PRCjevgtL/dT7hyvT3kIE+PCw9O4xuNc1VgOix0NY7yigUvuTqXn6wUWFA/5JzVGCBohwT7Sz9ogS/2Gasi57k+YTezqYhTU65JR091R1lp7fSpx6x57m8xBalu9L+Thx14MYAPqzV+YyAwGsaTJSbpZMHerk+qXDO9TEnVqY83Iro+QFVgl5XhLqoaCvm77CNw+/4duKVO48r3os4utBhPtcBf+t6dx3zaVbxj7bxIRijxRB+g0Yt1km5K/pWis2ciUGdqsgUJUdWrzNKdQcZ8XADx1TQjgb4YJj23yPZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UD9NlO1NyCUCM86zdc7PC74SLl7CAhWMA8JrSB7uTY=;
 b=RUKx95dht+qaLUycTXqu6AP64LOPDnSZNmo/7ZNqA2RD/UbmXtARNV2gcCWjlZKVXFNPRVjPUK4ONTd231IPmOrW6znkWi5ZLNf7wfngyba7BDu3T9vI8KxlDpixhBcut6+J2VYYkaOHWPEuTLOi+RoD1hfaXOAR4zlYoVMNUENF1bWsncKSLaDwZ7dK9foGsY7bFIcx++w3gmv3k2hawcC0swsdxxkNdUzSXSxlgkb5M+kTuiTPmxLSXGTAXLfE214v5BGgF+KCqT5tMzf1CERMMGUivH9fVB+hW84v1dNpE62NzsKO7gzQXMUQiIhpqloSiGMpI7vuK+KaG7g3ZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8926.eurprd04.prod.outlook.com (2603:10a6:102:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 15:09:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 15:09:26 +0000
Date: Mon, 12 Oct 2026 10:09:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dmaengine: arm-dma350: Fix source trigger bit
Message-ID: <asz4HcpTqd5oV0vY@SMW015318>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-2-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012084155.2547480-2-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: CY5PR18CA0049.namprd18.prod.outlook.com
 (2603:10b6:930:13::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e944953-24f8-4cce-cee9-08df2872cdf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|7416014|366016|376014|6133799003|10067099003|22082099003|18002099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	o1DkSn7ijfSESftBVG2DKB43ICdp3ecl6goqfTlJB0SZyDx2B7znAi1tNIXH9yahOc5V9A5d2yT8+nAkyEVIgPMPbLNA/aGcsjfkrs51D7OTJQ+4ooe5lp6MlqcKr5umN/jqGryyA6I2xVC8jfglexhNjP1Aa13La8AjGaCSVJhPIa6s7XWDHYuIfIaQRYVkPXqhPlJihUh++akecE+aD+4mUXwdCcRtB8LcqMh+OMZHe0KuHtNPsOQXyIJIKM27rW6k7SZExwN3FUAEQ/KZsC9c++NIu9XQYPFHKMedCNz+iTd3LlZ8s352ftZeiUTpzlBSUevIItb7/whVVNXqoqM8XYEeqUQhjr8losgiuk2OpU0Ooyk+5XGnaaESShuE1tKD28HiMRMvdST0OQzLLX0GJ3YSo04gF6BDEcnONzvGI4Ew0VgCPlYjKgMRuCAK/3I5St1SQptsFK6T1DQRejbwiMSqDVsIdMXPIBPPOJRsk67NXLVFLhlw37kbFVozQmwKNGqiFoqKgmo/Di9069KztSNEWsTX7/N5rG3IxnmNx9vSFBAhijNebFAp78hJYfEDPMn+Ti0ty3hvDNaZnpx9RrEOpxjTrVxi7g/j1OGR70UlvPMa5/WdkrCDuA3lb/1hgho2JqeiPx6vYwWesNda1Y24zqWC8E94gsMEDjw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(7416014)(366016)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w5dzHa59EX+Fw5BvZNzUxPtZg0MDsT+nylMms1dZGCeYGJxPTwpGAFV9SpwO?=
 =?us-ascii?Q?8NHhsoUF5TD7p4ouCQBixD+IKLTpeGlwg10qhVmWoGSawOPrEaKF4562FhCK?=
 =?us-ascii?Q?XLjuvpckxX88rWo0Esh0UxtEhYOzwaB7CcJoY35uT3H+KIcJR3uBQrK/J3Y5?=
 =?us-ascii?Q?sOqtMUC+av1/O1BYtS2ZbLdtz64ZYLB0SuXZHCU4LCFj0m+YNEtYXeJfJCdN?=
 =?us-ascii?Q?XrWNXSBc8MqB+USSHuCj6nBwnYUP6xuYohCfbkOyMGFOMi0NlCKTSe9M8a6I?=
 =?us-ascii?Q?PhUW46Ar2UXAterqPuiZy2iTtn5GHZ+CFOfVE9LOz98Ug6zjxlJh5chSTomG?=
 =?us-ascii?Q?toA+HtR5HKUrYHrOyWeWWOFWaG2A2mRmbw7Dr0NNsn0joirTe/M705NoFzDL?=
 =?us-ascii?Q?oFX7X+G4Nt1Jdn2jY6b1RkGHYE/AzAmj5XQnt67Uyiasd2U8DRJROEVIEidN?=
 =?us-ascii?Q?2J2e0wHk6u80V3J3rxx7P0MaIfnrJ46NRiBMMZfHMKu87DBkG6HH66Csn/Mc?=
 =?us-ascii?Q?q46bzA0Z5r/j+b3JfQVhuiAOdBp6ujfNM3SNoRuANvwJFDH8eTSlPDx4umZn?=
 =?us-ascii?Q?mq0nEWmopD4Ym4k2Ww3Cuw7IqnT5Ync5wp/211fPjtHNMJN/kp2420uFKlvz?=
 =?us-ascii?Q?eaYf1zSPx9mhEMPDCXXP7OtkTa8slLF9vPCJnBGK7NfziIJ8YV7v+Gna5Wta?=
 =?us-ascii?Q?YLQmIWh0k60i3Cw/vfS4aaQTuU3qk6sn/MehK3K0k9m+i6wvMCjsu9JcDeV5?=
 =?us-ascii?Q?PwN/1jMq06QGZxvkXk9ykA1Wz6rqOvjZNQbLrpwgVfeWbWMTEomg9Eo2316L?=
 =?us-ascii?Q?9G1YoqvKMqn44PSKNN8l30rdQE4/H7E7nmMAuMCRowL/UKJ4xjSMpIX6CgxO?=
 =?us-ascii?Q?JlGz5YUu+vskksYI3CbPJpsKnfGIgj3kOivXmP+rgrnjrq7LbGKQ8rVxEG0O?=
 =?us-ascii?Q?OnL4AItrT/Xqsf4Xme0DhD6ZxIUTJG9P7Cv1IJwiHoqr6cZxdx0z7paG/XnY?=
 =?us-ascii?Q?gf458Ieq3NE03LoHihjq7GtfKyG6J1YOlhr6J7NvkDkQIURmq1LJtjLWSswx?=
 =?us-ascii?Q?DgLgb5QkgXwOn1kDqT4RsA62tO2e7cfoxmgyJxKVZmpSLSigqKwzhB7c0GVH?=
 =?us-ascii?Q?oNWTAQvZiTPEfV0Mojdu6UUeMcLVsindE6cHjfh9dL5G+gKj7Y24ipu941Q4?=
 =?us-ascii?Q?pMq7B7ck8mjwcbCDg2vvhk1N+vNSW6IL1ty5HSOnBngzCro+SX30vWEInG2x?=
 =?us-ascii?Q?ApSwQF5uL+515Sv5G0D/71+qmltFgyx14MWxqB5XT71djaWJqE6w+LDlgOc+?=
 =?us-ascii?Q?fDmUEYul4N0r8bkjqYinXlmFUSO0ZoaZornFHlP5nWTv2hHQs27fcCFDSyOb?=
 =?us-ascii?Q?tiX5q01Daz+9oVrO7+HfHFzvcrAguX1rQgUGcXjgIblBUU2YJ0k1MMFUJ0R8?=
 =?us-ascii?Q?muJiP/zUhmCLpA8EXiXuSwvgJBUx6zg8/+39oqtxmHXrWIt9dQww3r6jvsHk?=
 =?us-ascii?Q?A0BtYW0BM0xi8G+uc/UWKqnVmMjgUQ4Eh41ViraxaJU/pXrYXRjXNz6/czyT?=
 =?us-ascii?Q?YDKi0O/TvQ5TRabD4f2jXTLHH1ZwB0eOQISiZORZy+a1ojjXnwbAGbGq4/XL?=
 =?us-ascii?Q?pE9D3xxBAWzZ8pC/REXuHbE94IGR908ZDhBmjN+JqXKM0yxnWr/ukPI2jalq?=
 =?us-ascii?Q?aFkXX6TyJcpdGv14QcNG43DI4yBWjRPwb7864inINuLvsF3gc0Jti3S8YJ0a?=
 =?us-ascii?Q?K2cbVoO0jUYamZoqaknjvkQhGGwvCFhItY5/5MmA1TWK9VLvyWq0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e944953-24f8-4cce-cee9-08df2872cdf7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 15:09:26.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+MOEAjR7tIzqrMbLXrf7qEba3uxtaT5VqCX3kVneJs7C1aOEJwEh66uKYBLw1k5f0CeQUJf1cDVDtobi8lWyOuTx9GIIym3YZwde9vh4bYF1HFp0w/LeElkimiajoIl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8926

On Mon, Oct 12, 2026 at 04:41:50PM +0800, Jelly Jia wrote:
> CH_CTRL_USESRCTRIGIN is the source trigger enable bit in CH_CTRL and
> must use bit 25, not bit 26 which is the destination trigger enable bit
> (CH_CTRL_USEDESTRIGIN).
>
> The constant has no users yet, but enabling the source trigger input
> would silently enable the destination trigger input instead, breaking
> any transfer that waits for a peripheral request. Fix it before the
> first user arrives.
>
> Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/arm-dma350.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 09403aca8bb0..4e17130de6c8 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -63,7 +63,7 @@
>
>  #define CH_CTRL			0x0c
>  #define CH_CTRL_USEDESTRIGIN	BIT(26)
> -#define CH_CTRL_USESRCTRIGIN	BIT(26)
> +#define CH_CTRL_USESRCTRIGIN	BIT(25)
>  #define CH_CTRL_DONETYPE	GENMASK(23, 21)
>  #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
>  #define CH_CTRL_XTYPE		GENMASK(11, 9)
> --
> 2.54.0
>
