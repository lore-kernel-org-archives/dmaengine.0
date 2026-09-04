Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357AE517BB5;
	Fri,  4 Sep 2026 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537571; cv=fail; b=LfsVgv4PlQKMxhDqT7sW1SBsuXV8mKA1F652fpgnPnp1gcNpeL64m2TJTWIAxXtyXFA6EuTMOaD3pilaJcWEwAdK1yeh5eGi2T956JxTd8k0wtNKWSdq5v0ugoMMXlVXTT73HPbsDvQQ62FMTg6FfrG34Fv3i7n0/FtbpmqvcIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537571; c=relaxed/simple;
	bh=suw2dk1s52pMdX6+2wejR9hqNYkV2xrhV1C+yJG/YbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rpux7S+lBj+8Ep7FwNvEcrx2wUpOz+N6FRWHCd592gr3laecKB2VgaUd49KOGQblaU5iD/tgqohslx9PsYrj11paYikQuuyaI32eihSGZm9IDqVfWSmrHiVGWDbs15dLbc0MtgIQBRe3YUyjXDlRVnQzdui0uZzLD+Qr8k4rA/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y9uhKF3v; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y9uhKF3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCKcPPOHnBBQ9s2kBC9fJ2AR/oQ6+oq7uJccGKPJNhASm6/XWeYfcBFyFYTm5ITbRAyoU5Y5bqs9pkW1WLKFoZr4Jz3gp0uVrwhMLfe67FmotuIuYwEhuAVzjHT11t6oPh3h5Rc28FNqe1cRV0EYjmS6VQE27S46g9y783E46xxPb9IqR8XW7i+JNgugwmNT5Q6sAXLxDjLY1z07eg0Zl7f32U1Rn5M6d2wljuAxdftgHI2j+KKL44YwsyLcQjTb8imq39DwdoCsXo4j3QWfjrDo29Ru4ssZHaSTc8B7D7/Cb4Lrpqjs8K8CNm0UOWAkdY33IkDaRpcrBrEqaaixyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WXZZ4xKHKdCCXDMYONYSFeNl/80G85FQd8mP2U9eHk=;
 b=Wh3alWWPd2wI2xSTREOyL5GoQaY8AO5gfGcPnqzrbUcJXbUNmv+KeVanGOl6MBJRfy/+tXz1dFAf9qS85PGc5DyjM4USnrNHS4p3pNtomewHXqTwjAvno30LfEyAi6rt/R/xBVV8P3eB0Ke6AlbljZGlGQE+sxKalvjnh9Uqg6sqjzYjh96PWG1cle/bBwAofsXQzaNqhBghppoD4qc/QG5fXDpjrYbq8AaBLA/H2+HHJI0Cwq17At+LmtgU5X2R7synMjK2I8IuXvqR7PSWv+gUXHwtY/LspB3QJr0b/NNBQtjj8t9TVVWOgVKXx+373YRO1yf7koXy107NYpHwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WXZZ4xKHKdCCXDMYONYSFeNl/80G85FQd8mP2U9eHk=;
 b=Y9uhKF3vHwJ2g4FZ+RZP/23/eHl0Dgt7+GwA6sDiIPki2QCBq43m43Cor/dSFR5PKuQJ56mbd1JPGJXwq9JXFuUDB5qj66IhOIzwBIm8tw7seN3WwvT+SFEwVDfKfxysK4wJHvFiBVoHsVGt5kEK8mnvFFxBJuGrZKXXj2toVetjxy8ZC0Bo//+ooo7Ho82znnBoPCHSMUxA3ubeEM1Gp3hot/jtBiWXiQfMecO/mGZDqiFmZ6f0WuEKX179TeznYOAN1izmQUP54Ive8gr7McPslb4977JP/ZJ1zPK4tHUh6rncgxe/BpS2j5aPBZ5UsQrXqGq4UdsqgFcWJzKOTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11714.eurprd04.prod.outlook.com (2603:10a6:102:526::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:59:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 15:59:27 +0000
Date: Fri, 4 Sep 2026 11:59:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	"moderated list:ARM/UNIPHIER ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 25/26] dmaengine: uniphier-xdmac: Remove redundant
 dev_err()/dev_err_probe()
Message-ID: <aprq16SYGQEazTd9@lizhi-Precision-Tower-5810>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <20260709135846.97972-26-panchuang@vivo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709135846.97972-26-panchuang@vivo.com>
X-ClientProxiedBy: CYZPR17CA0003.namprd17.prod.outlook.com
 (2603:10b6:930:8c::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11714:EE_
X-MS-Office365-Filtering-Correlation-Id: 49af4969-cd9f-4724-73c6-08df0a9d7f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|10067099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+w+cEHNBkT1LeZ9UNnZAMbzT/qkfjoP+buj3DWW4CIaBXz3Via9mqtn7G6yvprKGrWGBppMWfdzc/tmKkg7crgBp/qPWPPKk9/W0BsSKW4nfoKI/kkSr3fRYri6U6MjtT28TlAGbOmT95mfHxLk0WZ72Ca8Y5T7oE2UFoj4XGfNxFi2H48B1+A4cPfNASA8BafjzzVFeUs3kiPfWx6Z0pbKYa8FcSpr+FkpMdiVPmPZf1sR9Cg5mYfNqEU4XTJxydQ3svXoVf99D29YMW2b8yLZ9K8gQipEg5r3k7fyfD9ogpN7XIGQ6LorqrhZRXbCijv9NARL9qkx0obyRLQhkDxbqTuoxjekayBOXnD3P2lHXTdRHbGLHzOa5HE2w2q6BfbyZODM+00fOHjzTzVuJs+DbunFH0Z8ba1/D5d4ssZmDdRtxzim0CfzMnp4C6es6ueOZvaQEYMzwFfQmlcHb0BMPykBoL2zbzpXL1gn0kNV4S5Unyv34JO+Dfj/Re/UOJ1XB/50xLzfSJHk6K65S4RwKaOs7mKFZ4DToQupwd/SslA9cgHImTHDK2Dprs86egiVj9AleIq+BDCJ6+HmuBGzAvfAp8DUgScNYQ56OdyasyQ19z1+9qG1zUZku4y57b9ZtryxFElp63e39MpAThvblNIkrY9Tl60BXv18hzrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ds0AQXRj+4aqnicuLvnJ1QQUR83+1TBZEFEnfB+kPSBAXR1knWtlpjwnFVYb?=
 =?us-ascii?Q?9bxIqM8ZBU5uq+FJjapgsc8MOxC7eqBqUScR1fkwxGPqG5O/6VZfUEu12uKc?=
 =?us-ascii?Q?vc2YTaRLeiZwv1O6ZlCfSFyU6G0Yh8gl1DV7foR5vZBystEvI+s/pPozktGL?=
 =?us-ascii?Q?VuOaPjWInOzURNwik9u1eAR9e5qZZSXAcTPRwnnL8+wibSJj82R7QtSZXYaO?=
 =?us-ascii?Q?dFQFK7YqX8zRMEn/wITdX4Bl8epuApe0zwsf8R65/CXmDZOREDDJ2LKbHL1W?=
 =?us-ascii?Q?G353ifBTSaqYNYZpFReBIJi+1RQmlg54QuSj0uo+BxGW93rf8vRDikvWcb87?=
 =?us-ascii?Q?Xc7FJ5gJZ0ZRZ8dFQ7DoWSG7Apya38Jr47bE1x71NwV2eGbSyWHoOLNDHZiw?=
 =?us-ascii?Q?2Uc7inyOFtu+WXb9KXhE1mdZMDv7t7M5H8Voz44xgMSiDlrTgB2jtuIPCgyB?=
 =?us-ascii?Q?oOlbnlOYFI0Ox9+bVL+A9LNyBxoJuhNJWdRf6PJC5plQKm03SMaa86kyNZ6z?=
 =?us-ascii?Q?Uq2c57k4qENMk95uAcmprqGYAnAxzvb3UXABiIr2RV3oVbgKDFngnOwv3kzm?=
 =?us-ascii?Q?quDWOT+Yl8btdbzquLeTL+pujxgEWbQOGv2Lavobe70yVVBcDvoaddTxy9Ge?=
 =?us-ascii?Q?Hn8OfAIhYYNXT+fNjxlAB0COOyr+pU5eO49p5IJc28D61xg08jcuQTFeFcLI?=
 =?us-ascii?Q?0pBK5JL7HT9KYwZKRo6jiocWOCl+jZO/fmwIALAWwdlwRlItTRw6owVScWGq?=
 =?us-ascii?Q?wfMb8EBcRU8kJsGNxZurFhOisX0S24AZH4AQ1zOhK/OsDVg6p4EUbxTRT6+P?=
 =?us-ascii?Q?bmCLb9inRfgsYP/b2aZruN/R7b08hQuuztY7vFO6eY05CVgRmD0T0nCpmhvR?=
 =?us-ascii?Q?EvVg+nTWcl/uB2F1/aZluDIJsvCe0pUJkwKLssFp8zu+3JjYA541f+yGFUNE?=
 =?us-ascii?Q?RrWuUMU4LEAr31+KbDiqgZ6EIkPNj/wYDj0ruMfvC8/UjuLA2YPLBetSDWuw?=
 =?us-ascii?Q?PrUgbCKRa0D9ZGqioQ1XEAa1HOpVj5TrxaJXBwT94kycDviGx/6Nv7O//DZu?=
 =?us-ascii?Q?Q1ZMpkEfgMOTKAS6nMMDLmiN3A8mQNuKDtZb7yEDz1F01dRgfAL3Wmir2uIC?=
 =?us-ascii?Q?U6+O7PckXtZjlfa/LZkRnXE932dh0UKJ63izjRJJ2sMCNs8AsPUfZmJ1zIew?=
 =?us-ascii?Q?2PjN7sXiIu23ILQ0jWfEyDfQ/iaQeTacoBm9OKoIw8aznpkD8zpkK0yUZhJk?=
 =?us-ascii?Q?YptF/ymLHvP8iIX/0UlUefwwvXssoFXJar/sK2aJS8qXMIJAF/TLax5ZQY9D?=
 =?us-ascii?Q?6wmmCars6v5zxmTbG4Jg9VLQM7XZ4Y9gtcg285AflD/4JG89HGs9GxGW5+yY?=
 =?us-ascii?Q?j67Malps5TbjxtpALWXNtfGr5iGYYpzf9lwm8t+kmVairC/5aJ30q+BrOiCo?=
 =?us-ascii?Q?gjSnV2g8iTG2biqMyJnAsEa/CRQh5fvVSQHd1Kk3XIBEGDoyB+BlpInlwQ5T?=
 =?us-ascii?Q?vAoCXtErR4dEkguegA1Moi0V9q9PjAMVmdQeoCQud9TQxFdfuMVlSnyL7X9e?=
 =?us-ascii?Q?Y1HQznbBPMo5C44cWrQO1QIXD2HW9+M65ZeShkuPo7gbUHOVFOs4onog3ZR+?=
 =?us-ascii?Q?fiJ/FBgcQ/ICJrq4ZhnB4m3yMCgOUvzYdLohSSfhE4V2Sbord6KvIAvszvwv?=
 =?us-ascii?Q?CkSswkFrR/MmawogmWytxAtWPRkAKVECsN3wtfLRU2z8V629QkyBL9BdsOUj?=
 =?us-ascii?Q?hyscqE84LW5kz4gz3ofkwpsEG7iBmFKVjdq//ScUvckAtVakhbDM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49af4969-cd9f-4724-73c6-08df0a9d7f09
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:59:27.0088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngeGA6t2Mzt4OHAUuKYVGrWZTgzlk4YPJgCk+W/v5kS5RxfRfO2GOAQXoZGONyM0teIwQYAtxMcw+kocXqsrqq4q2/IODSUNmefQzjoI8aKv0UZeWyiKIoL3INx1nkCl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11714

On Thu, Jul 09, 2026 at 09:58:29PM +0800, Pan Chuang wrote:
> The devm_request_irq() now automatically logs detailed error messages on
> failure. This eliminates the need for driver-specific dev_err() and
> dev_err_probe() calls that previously printed generic messages.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/uniphier-xdmac.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
> index 120c0d4f12dd..b23d61bf7fd5 100644
> --- a/drivers/dma/uniphier-xdmac.c
> +++ b/drivers/dma/uniphier-xdmac.c
> @@ -532,10 +532,8 @@ static int uniphier_xdmac_probe(struct platform_device *pdev)
>
>  	ret = devm_request_irq(dev, irq, uniphier_xdmac_irq_handler,
>  			       IRQF_SHARED, "xdmac", xdev);
> -	if (ret) {
> -		dev_err(dev, "Failed to request IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>
>  	ret = dma_async_device_register(ddev);
>  	if (ret) {
> --
> 2.34.1
>
