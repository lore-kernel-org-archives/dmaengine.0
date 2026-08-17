Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0393EAC84;
	Mon, 17 Aug 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974963; cv=fail; b=q3AzSGls8xy2eVcqfpfm5W6eUkmfjEmbbVHC6ybxcUjU+gBhsVTSFM9k5oBfD5ZhnwZ7a7fKmLPD2/IaEzxxw7a5isnKKGxUmFEXmSeXY9F92+grDgDKqK53poaMggzeD5pQYBXEBrmBkuyugV1uKGw5LsEca1pYCq0wjlgHOdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974963; c=relaxed/simple;
	bh=fTCM3lJMX+Tj/VMFwnlnZbtPni+xRx3eylk99vEXOMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Nir9us+u9QiMphG+kOiRo2X+pvpCnb5LauntN8XI+KUzD63Qr+rL7jEB2HtTTAhjMWhsxxHnpuTsOkNCP8SuShrW0USlgk2D96pvNNwSTFnjthYY0tz7Fu8eYtz+nZJVi6jNEoBhpY8QeL4d1NdO/XZ1KiQPBQOX3TpODQ2xZlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SJBvrIl9; arc=fail smtp.client-ip=52.101.72.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SJBvrIl9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWhp7dc5qQbDAEESyB4o2Etplwe5iD/fa5BSG5HJlrFBBw1b0smAYtSRj+Xxf4cJB5uAIRVvJz09MkF4CTX3TueuJyuRJUlfAQvwiQRzUp/9yd46F5GKTmxYigFpAK47zRIUltEhZB1lK5dVAlDvRGKWFAKMnznFnKOnrMhP0mKCqe8vCcvrsdmCnER+3hYxHlthRRfRuQIyNWgkjTUndV6qjPNzNXCyw50V+uA6GkNU4PpgEBkBwWHCH2u5mgeWBNrUMX+mxVcWZbJ4wkzsP/zEHDWnW3do36sew+5c0uWPjr5YxqSAzNeNiHg0xpV6fWAUjsjlGjfoYJQXA4T5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcrJBankKBpntOb1UXqNSWcA/d+Vcak6jU0x7hfUuqg=;
 b=HXsl2iSDsByyuk7Vrk94MnmgyQKHa7qVUmH7/eUJjVXCamTgZiVqlrFzXWCTfOzYZEIyWIL16fdDyZ7TqdtL94q8/wTHcg3NUWSWuXiFvJrSTOgRGPyIsDAufUyWXiyKAJgDUGXieK25HkLbSZJmJ3ITYU1gOOQYLgbAXwBfWaU6HL2X9GgXLEZtbhLS/oBdV/r1UQjleFrf4xyxsBI8XLPVrx/OjYZX+iPi7XtntgUkaooELxyzuzvI3AzUdOqzPVaHFUPPjo9ahd0ISbzz85XW6U4RxeXchdritCndT/38xRqTAfH3Q/O3WOb/e4FAiadbXGJFRYLIZfkPE05gLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcrJBankKBpntOb1UXqNSWcA/d+Vcak6jU0x7hfUuqg=;
 b=SJBvrIl9DuB+q+86+Z7pe64snWNJj7s8Axhi0kh1DO2u1H7lsbad9wB3tiO3A/UeZUAg23h+utOegz+6xhqgRYFetR4VhDlmGNEnqrIu1hN1FmLLI/eVoywWp7AMO+pLePTJGJEUICNYZjbY3p+AfGbc7m4hwKipxuavrn3tmAhgx8eHBQ8V56uOyfJalaGiau63JYzDayj4N5Ku9bSb772OlNNyliEMjLvBa0OV3rXQgS/UyL8f5zND9Vw4M/P9c0h+XLxPgaGqjVUv0DTqwg31Zge8wA3CofhmPcTJ58sQFEdu2zGE1RVmeajpHoyjYn8K/Fqhqax7xlpk5TjfZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11399.eurprd04.prod.outlook.com (2603:10a6:150:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 13:55:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 13:55:52 +0000
Date: Mon, 17 Aug 2026 08:55:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Paul Mackerras <paulus@ozlabs.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: bestcomm: set bcom_eng to NULL on probe
 failure
Message-ID: <aoMS3r6mQjDMKbMx@SMW015318>
References: <20260817015442.136038-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817015442.136038-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11399:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae98511-ce79-484e-5756-08defc67403a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZFdv9EeERDSxsa44w1NKnIG0Nk6OgYfAf6FV5r2B42Kdk4chH2RL1lxMvFPriiNhK8jy+wriHCS882Mi81492tMaOtM5TXI3hig3ekjSkAgQ9xENQ8oNBDJLH3gkcyxdOYBe17OlvfMmvurSKT3LOWwI45RujSDuVTyKofmUbsA5y1tcYYMOZNNGpOYYoT4+tR1U3jvCcG6ZuYhzLFn4gmdf47UCKt6KZn3EuDxVrHQszfNqcl2ikUpuvFdQRGOy9GfDTy4Y7brBI6KI4J0/hjZDCHLsm3b9SKtjKcULKKTWoo2zanIstmmkOvJhwOt2Gu5c9IsbHJ0w4cqxUOEq9KAY1opDURVDvywYIAN9pwDSk2rDAy+/qguwxCasUJKhMirjwLkZqc/BCQMWy4wB+RQOzv/qUOQYFz1Mr6Gg45j+NwS//LK0Go3ifEYAUOh1M/DhRQFsaycWucbttdwMc79lJ++/H1irvSRv/rmNu5CMK99pMalfESkLa1amYbivVV0qcG7UnSdbX5l3L27Gg2lEqWaCzolC7ltSfPeIPMIo3rT7EnMbheMfWCNbJtApsfH2FBd1h+2CdOF+Av/enrKT+YjsiJNZxvvSWYyj3YqlsIf/RP54ylKMh1hPy7CMtvTi3ynvESfhEsN63/5d1lNsD71qisjNN/q5xivt/RI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7i3waJYR2lsiG8VNEuIGn96C/PsUJ/O/iYUOlNN+3lE0s9iio7z7+xriUY4W?=
 =?us-ascii?Q?of5eJpORUpNHadAjnGu45CPRz84xDzmXhKRWJD0HZrAGd/WWM0rsnb85+2s4?=
 =?us-ascii?Q?4EyAFyimlRk81T3wkx+tST0Wjw2wD5LI+dCoqUqUIM9YibpeszBli75UMPpx?=
 =?us-ascii?Q?RjXCdMGEBDRAp8PWzCV77WQQdCRoihAEzNLGxM+5TzAGqoKYYohdeiPRqa1W?=
 =?us-ascii?Q?uCZkXnPT0cEzeC+gWk3WC5jC/RHgywGFNl3tPZNKyoHHN9ZEVnAKMyF2gxbH?=
 =?us-ascii?Q?XxjA0YaBPoQEWr72jdqG6bgZrP61sK3DN0H0IXB3cYe86yiUI7Aer4WzWtO2?=
 =?us-ascii?Q?W0pMLSZgqVb+FerqCNaIH1k6h2SNijXv40uI18uRivGLanCU4W3gsPH8kDuo?=
 =?us-ascii?Q?ek4sEOYODToAO5NrWP3dcWeIEY5SlEqEXILya/RTtnBm6sWkAt4YulzSkI1n?=
 =?us-ascii?Q?9yxUOfz1XH5lYNzeMNrrG8+AQ+0piwWcT+xSNuOLQLBp49bKo3THxCkO362j?=
 =?us-ascii?Q?3fZlU0Tc2uNMFvDkuyviOjEcbqjaYsxvO5+72iWYD2b/C+ul0ucaqr/LP8+r?=
 =?us-ascii?Q?5mrqpiktR+6YjXUX3rw4dPpieKOrBmSDwjmWd5hSGz5tv3SFkBCdYrJaWGaZ?=
 =?us-ascii?Q?I6Pxi5IUgz2e1pVJnlV3HoaGK5LaCfrL/0PlbL/1ISa3BsMokvYv4ZTvlf7n?=
 =?us-ascii?Q?F8JxOb7ifElCs8aAIqQF1SxB9VprxoaYl2Us60Fth6dMdJkn46tEqLJEKiCL?=
 =?us-ascii?Q?3rBTFBEHiGU8eOAXK/8jEVwy/ASCvKLChbOEo1v0VfhJBvBKfEWbirebUXJS?=
 =?us-ascii?Q?WmhXZwFm/XZjp0obuTld1yLpKj1Thjc6601i3J98KY31dzlh0SZXgRTIJLBG?=
 =?us-ascii?Q?yq//HS8yvZogB9pR2MFP+qEpVyD0Ar15JvhXiZ03pY8mIYwJ6qhRL6ayf6QA?=
 =?us-ascii?Q?01/YGGE0H09AO/xI5+ysddN9PXkIhNuMyaPCtdYyWPoYjHcuuoSxdxZ/Jelb?=
 =?us-ascii?Q?hfPvlFJ4glmdNWdnkKw1ICgLG4UikCTYDzg1/VnulLu4tWXtQMXcgrMXbSs9?=
 =?us-ascii?Q?0hpyv0E1W55lggieNyWUzmuYB3cH4sF+BIfwJlI4E21P9E0R+RRbT72B/St9?=
 =?us-ascii?Q?gHXkMgStHiEEWEbBirfg0XxucJ4zngwjKsyaJS3V3VTF7NMs2A2BTPH79Vtd?=
 =?us-ascii?Q?F/9DwFP8Thzp1osjrmQfh1oduIQ/zXkVEHPEMwmgh/Dg9ZhMStTN0VFNfx4j?=
 =?us-ascii?Q?kfOmpqpri8RU3H43J+WOqtEDFQmGqWjzWSGUPAT3FEieYQNkE0F8SD58CY+9?=
 =?us-ascii?Q?BdXRWNI2+zLeMITPT8vSOK0cmcnil6ozfHR1DL1J9AlkP9T2+MGOUfxnacAl?=
 =?us-ascii?Q?SZqOz/3xMvYjuL3JlkWU9QxYOh+WmEXnwHQj30pHYbPAFtL/cVF7RJjU/dwV?=
 =?us-ascii?Q?7C5ZwogJr9hyza3mChedN5B9cjxAkGozKT0fD8ZeOucGaYJvP05ZAKsgbUAr?=
 =?us-ascii?Q?vFL+L1g8n2wdPs1mpZ+u4FNSuFDeO9lgKv5eeGB5bvpNXMfr8NzVYOHZlUHe?=
 =?us-ascii?Q?rgGLS40zEMH8Ib5WbA5cjHzizroFVVV6siH4/r7J2v1jE6t6sTtIxk5Hf94J?=
 =?us-ascii?Q?K0N/urzXX27N2wNv2u0GDwvgyINmLv3gCMkQ/JC4RlKBpAdrMyfrXOUqR2hE?=
 =?us-ascii?Q?mk3DNfw0ETBnKAPwn5CLvwpUfQZKFhkXac3h6R7MRgx75et1QKNRYfPJk1vC?=
 =?us-ascii?Q?QgdDnoKVyPqPkqI4uW8JnSkQcBcrz3/Kqc3snITyA9Q6BzrHJ/wz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae98511-ce79-484e-5756-08defc67403a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 13:55:52.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sm/oDSum2FvFVhewb5/6IXPE/LVpSprKOFhwLsgg19gywf/28j7WN6JdBXj0AjStHdZlG24Oz1zcMLXF1+vyEhstpbzZxFAtju2aNFXKbmwkw+XwEZmcdF603zm8aSqJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11399

On Sun, Aug 16, 2026 at 06:54:42PM -0700, Rosen Penev wrote:
> Functions like bcom_task_alloc() use if (!bcom_eng) as a safety readiness
> check. If the probe fails and hits this error path, subsequent or concurrent
> API calls will bypass the check and dereference the freed memory.
>
> Fixes: 9560aea4e9d1 ("[POWERPC] mpc5200: Fix null dereference if bestcomm fails to initialize")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Not sure that still have power pc user.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/bestcomm/bestcomm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index 432b43520ddc..ec58d2c6573f 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
> @@ -445,6 +445,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);
> +	bcom_eng = NULL;
>  	bcom_sram_cleanup();
>  error_ofput:
>  	of_node_put(op->dev.of_node);
> --
> 2.55.0
>
