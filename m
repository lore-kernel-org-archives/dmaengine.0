Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500054A5EB3;
	Thu, 24 Sep 2026 15:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265276; cv=fail; b=MmzRA0vo4tV9JXc9h3u8SOfzUb6IKG82sGA2Q382aGpSAyYWqrFUt+vFnJhpcpai9hCthOIkjWW4rFcTIDRPXyl94wfLJp71vTIU1kkzBefv99E9lEIf+Lw3CmmrE9kAIsrp7Ior6IioL3IY8Oj2bUFZWSS/UVdBqaydIDJihdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265276; c=relaxed/simple;
	bh=APc115JYPf14IlFOseyC8PNOSerF4W/ji+h7y9bREp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ff/+JPqSR7SXOjsz8pf5Aps9p1gQ7NCZwE+XhG7FbPYj1pSpeoHZBSxemwPP+nbbJWAnU3G0GuQIzrYMxq2IW9QQ5bs64rXB00T43DDIzVozfxr/4K7yCGdXFtbwwb2E46PXqs43EcW8l3rJwqJeEuTcTpYFDlcydjZCdwllXSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TN9o15mI; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TN9o15mI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdFYFdb1ugsiniASlxCg7FmedGwSW0trpKakltG06xVcin2Sg43V35pZN9kdDriH6HU0S4neYQ9HZ6T3qDBcGUsM9dt75B/1yT3bp3O/5ZN31TrSzdZLCIP8LM7UGGPxioNstt9zfDpUDJ6XT3rbsAT3/c8FFX31ADK6+iY++oq93N9JFcXxXeTFRcj+z9Q6eVsF5GAoN+m8Yo3lFndOwQBiSwWUhqxVKBW6MZfeRuJCwoqCAg8FWAIE5Vi257DvG92QZBIQUfyGoFKQbVSLnwg4YKyLvRUhy8iDoY03Vtvt19iiJv3x7hXU9SwVBLtj3ac9A4zNonaMQPPO4PeCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXkr90Z249yAITN6Ysb7tv2GCJDIOW4x7C3fOsVRJiA=;
 b=Q3tnuooK7okc+iLS2IalqRqd7/M6zUf2xVCrI0ciJctB6Yl+Fdkgpl6QyLf7rZLEmUYDyAy5kc60unQyShwILGYZou/0LyUFt18JKoUGrf1uhrILDtpFin4CDr9YAWE6/BzEPBMRfmqnXxfDKYgpy2SgAmKeOuf7Khu4I4HueSPFl2AR1a7jRHcUHxQPxZvzePAYZlJi58CZfghV4AQrvzk5Yjcwtaa9UbbhczTjxciH2P63WJ/FABAuheszLFPYxETvbjhYYLCps88FDeyn71RhXzlScGm5xARaPATYsuhIsKJXWVBskGnOTwyspKyfxCdFC2M86m7zxaqZgcTYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXkr90Z249yAITN6Ysb7tv2GCJDIOW4x7C3fOsVRJiA=;
 b=TN9o15mIW2wO77Rt6eMGO9+fOhNpwSi80E8z6opDgRVs5ZIihixgS5i3upQ4gurkZkU4C7MGL5ltWk/lOtl6+HxSEuXPfZ1IY1t7rIDAxUO5naNyDcs4tyO6LDmwU37AtjACkqvjCSJI4bmAmagePEth2E1zzERHKdzweS/lAwYRymZx6fU5TX8xEI8DJB2nGL20ilOFuqMO6gnjIiP9zPSCpAEogDYqZxlxglvjzW1QowGWAL67a2Pgz7l7Y/ngyZHNGWejiyMJHxNrM06D4bkbwZTbN+9dk5kZ2xY8dARoIbkk63Zw12cjZMgk8SK4g+BKCjx513pE1ep2QRI4bA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:54:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:54:31 +0000
Date: Thu, 24 Sep 2026 10:54:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 17/23] dmaengine: ste_dma40: Validate DMA specifier
 length
Message-ID: <arVHsD0YF2XQQfe0@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-17-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-17-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CYZPR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:930:a2::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: ea273945-86bf-4e78-058c-08df1a541f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|4143699003|6133799003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o2993lyAFeaPoQBj+8ZLCf6ZNiEDZXbpkcP9mOEm0ngOzzzXg/hAf/4yJZtnjFTPZihXQB3dKBfi0s6vf7i8QBEVFuFbU+amrginEWxm4rGGEorzfMqWvXNRKmYg/V/1s+9qoYAJkoSU8IIEpwRAwYzhCsbAyeGfCz5oavHTUzzgrjI3PPhlQcXUWFrIW87UiTqrUHl96A9iWrVb118Y1LViRcLfhLJBi8dt2IfR36M6XrgWHZzO784jO1dsPSygpmtat63DVDaZc397dDFNd10gn5RRZqgMXN+YdzUTDKU+WZMONW60PbZ46cJrHx0YbQmY6Vm9lJc96NeW3fjq6vb/JtgF+dW4NhGsTTJrDC84UKK34kyDzqqtZv2hG4lNy57bljlRC8aT7o9GZHY1drQGE9DNCn9PtU95DnALq7ax8B8BkKdMt7DYIzA3hE85u8h2up70AivZyd381oVCXG5GcPkvRzmdOEChEEDTPYDW/fVHXqcadYSG0DTbGMnAf8TZWcffaHsytiQ7g+50zHCsSIaavShx4oCg580+porUws0+MN2xaNvLxU+ewbXiFGg6P4KOXL1uYfR43uBZ3vI/SxUGWUo/nv7JQ0gbpI0SWE9y7VGQg7SV/rcDA+rWiepHPgQM/CayLaHK5Q60qmEJFXIhr6OAH6Ruf0unfwc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(4143699003)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3/Fx8w+7g3MsOrP8ugCKgnglRoeI8xtBtVNhP3n/onkD2YFac/J1KGmTP5Ie?=
 =?us-ascii?Q?cYfBbCtN3SDMY0+6N7Rw0Jt8IeN5gKQkzJZuEtSifihHQePTKtG3kDJo8Nyp?=
 =?us-ascii?Q?Ot5wUNgc8xVjpXi6QvZnmdzqmY+t5+0bBnmxZP78Y0l4u+CXXNiWlIaBpicm?=
 =?us-ascii?Q?7Y3zevUfQc4y12t2hlU3bDu4XvvfKJLBKcE2OICxrv6A04eDgJ+I5c3vGKQo?=
 =?us-ascii?Q?zLw6x6oQEwvaEtPRLq3dOnpFfi58C/SylMPkLukLfrjJBIP88wSnjIFf+3aq?=
 =?us-ascii?Q?63pgQUmTT5QvjZXhY+LA28Uc5C1VwKadlp7Vun9CQeDzRzzaHZmqi1aq+PZn?=
 =?us-ascii?Q?1xaUX9TNkORFeznKP4Td2TVvHcV4ODZZm2mpOmGesh/CQX+S3UgHPAZHGU+E?=
 =?us-ascii?Q?OX38vLOKrWywOOIY2wzb+aPIMuZ+/cRTeRzbOIEr/XZ+egXD3sH1zhfyWYDC?=
 =?us-ascii?Q?r3jNF8oAsC7alQXe897d+yXU8UGKBAtXMHxCdFD4kIek6bSgfcdc3QUbxYW/?=
 =?us-ascii?Q?oyzlREduoBB2cXKOJxJWAZ0PjAkBtUb4BBT9nhYuft7uHu1mHJTOariaBrdA?=
 =?us-ascii?Q?zYyuVqKzWAxmSsBjAScNf8ximigjg42VFgFm525+OF0nepI/5uSz3Q9oAiU2?=
 =?us-ascii?Q?nvP89Uy8kNgFuah9yi5Sa0YBoh0JivgrskuJ6CnCVHyI7HqazWwEzD+0bvxS?=
 =?us-ascii?Q?weBRm0tgk+IURTlOWyziT6hbOqwzIeN4fj8DGrTEUdtxCePraNrKVJlRym2Z?=
 =?us-ascii?Q?V6LeXrR83vvAXQyUGeFD3huLF/wvTpdu89+oHYAkZc0I530o4zvq7x4pNCtW?=
 =?us-ascii?Q?Vxt1FsZUrKWxAvRGsj4sPP7zbjMF9t2oXkayOHuPuonbTK3SymLPLuhVXEu2?=
 =?us-ascii?Q?ckOXkk3BEKUurhED+xelWie1VSj/BGfEcUdG64lgmAHFkb+gjg0RuCy+xJ/9?=
 =?us-ascii?Q?0Hc/lTgVsJ67PxqYypyAKoAjvs2Pe7+Iotru05li8uTaSHjwxs++W79PymBY?=
 =?us-ascii?Q?Pui5WH7tiLE+Ajh2YiXhB4K7YnlwTY1VyEBcrZZaPlwj1Xxfm1spbsWoew+a?=
 =?us-ascii?Q?9AdIHoRcRUFGIMyyg3DZ5qrQb3kHTOqynMXyoBq1lPKI1nNNpL+Lt7xhPWGP?=
 =?us-ascii?Q?rCQYnpVLi0j/X+tAEMrRsDdxSG+auwDwUol++Rwkb8xCjT9zu73aZWcOVUTU?=
 =?us-ascii?Q?9/NptFhVQIb3bl2QjfZSoUo7snEDXGhI64etBKY0lCQGiYN9CAjE61DFxaDH?=
 =?us-ascii?Q?YY9ed283G+rc5gPR6d0x1obsEHTe7rnQ4Nr2ewOGznVjSdupBbFl8R1yx39+?=
 =?us-ascii?Q?d7KWoq0WCZPb986WX4cVxX5iPhT52kbcMQpanzhIcQ+9DQnNZMZaAWWstmI5?=
 =?us-ascii?Q?9ElNUJaAIZWIVcbaJC/lJtwOi68429/oWUwzNWcHjk0M6QrSOHzEKeeXPiJO?=
 =?us-ascii?Q?LaAaKvChQX4Bva0JeWTnQYgSkp62zKVPbVAg8juiiGTr8YgMZJb8nVX05Qcl?=
 =?us-ascii?Q?Ef864OuitAkHSEz0YCXmLDtuk/qeSJsvC9HDCxs40joRKOd/UsLt92MvGEBQ?=
 =?us-ascii?Q?8yGgoF58HnNitvoqzP8F0YORfVutYyqEENlUDKT5CZC705wlE+RQGAvQLkRC?=
 =?us-ascii?Q?Xpuj/fhyIOICBFHmDGiDslvhy1l21lJPJ6TwpPQ3+5A/o7almcua1OJSWakL?=
 =?us-ascii?Q?SqXDEhvSKqsKRDaVcNXt6Jxskf8+gfo5QkRmx3Ke/oisjZYP2+oYPON7xeks?=
 =?us-ascii?Q?m5fWvzhCxAbw9qHxsQI6RenmDy0oTnDOiTt6JQD1NwZ3kRNPSgL8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea273945-86bf-4e78-058c-08df1a541f39
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:54:31.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVNDsRrYESpmuqlFQ8nO9g/B558574GAeFNp6UKIe8GhGTsaGwXOntfMyL59HJDUGEjn4dS4ebMpB9Ec+sXhZZMkxFowYygaUK33CMB1xve4K1Ss73logSxNsx5lm0bC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8822

On Thu, Sep 24, 2026 at 10:35:29AM +0200, Linus Walleij wrote:
> The DMA40 binding requires three cells, but d40_xlate() reads args[0],
> args[1], and args[2] without checking args_count. A malformed provider node
> can specify fewer cells, leaving some of these values uninitialized when
> the OF DMA core invokes the translation callback.
>
> Reject specifiers that do not contain exactly three cells before reading
> the argument array.
>
> Fixes: fa332de5c6b3 ("dmaengine: ste_dma40: Supply full Device Tree parsing support")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index ed233676e718..660ac63efb40 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2545,6 +2545,9 @@ static struct dma_chan *d40_xlate(struct of_phandle_args *dma_spec,
>  	dma_cap_mask_t cap;
>  	u32 flags;
>
> +	if (dma_spec->args_count != 3)
> +		return NULL;
> +
>  	memset(&cfg, 0, sizeof(struct stedma40_chan_cfg));
>
>  	dma_cap_zero(cap);
>
> --
> 2.55.0
>
