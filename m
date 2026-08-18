Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128147A0B5;
	Tue, 18 Aug 2026 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071113; cv=fail; b=ZppDU7tYomWyBBvorivELdQLPm2UBCx6gnnwiME5uQZqgY+i/hQsg4+R+hsdagDUHbTSW61F3FtRr+YJVwWKLJcrtboJ1TToB40gMkvPggZOAtGZOg0iZI1rRIiXYaSQ5QbJ4q1YCUr5jP5ueeKBxRbVl2Lv7q9zIyjKyBI/3Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071113; c=relaxed/simple;
	bh=OOz28HPPYIXbRTv1U3DdRJRs2zUBZbdzadc4Hb4G3t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JqSv7VjK77oX9eErZ16roH8ClI0WTmEnwMfExKBf769BhSEtQItGr0fkHGfn2Q6WBrs9KrjyMVAhhD3YI5w8+BqDf2JLP24nxkEecmWiDWPshBX5bJ/Zcsnf9/HXqyH8vsFi6sjzAmVFrxfMDAZHaJ0outE6kKJGE6vvbWxEh68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o7w3+a2p; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o7w3+a2p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1N+jscOIhfR8V5W1k7zRtvdRhe3UIui8fwa/V0DjwxFecZjmlvffVxT9X576MWt7hxqlPjnpQcdZN1YecILfDL/preOF07lE9rW52MQwY3JhdlwldI+POcFj8xQMgnft2EcdDGqbCcb3TVTHmju5u9I9WN/4GoU9g+nLfAfGkgedTk0HJJzgsX6yRh8OwanLBpJdUT272pauaaK8eF15rO0Lbx/WkvaKFiID0yrUblYpl6Gti5V1WRPBdzqB98hKn/xj1iunThEKICfiz1n3/HciYw6J4cFGAr6527l2y8fTTCFE6DMnHdb8s4qDTD2Nz1UiwgQTbG5CNgThUK5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDGmnVtVLk10cTWgZqwGOh4xLnuMQITNJ+Di0P9rIKE=;
 b=egbWP70yiP8wSU3DSD0ltNX/tXjmHcmnjwVD/lS6U+UEZlaABNpnEthle35yVvTFQR9oUttcgEb4+wW4NjG9zMUg4eOsPiICSyxBAM1AW9iwsjZc6XkrfXidpHq6JMGsqKaGsmLIYy9RpZCbSzOaMQrSIesnOb3aQfzuiALFD5J3fD3JwIni6dT6ELGEnDCtIDUqdl5uhYgITFfOGVywH4bi5c6/Ih1m7JbSthJTvPGYDPsHSdzAgzTmCXEFmCUREOOQFQEYhxG7ry1J6PL+3DLOBo1Y4Cv5QwnOEwwRvkSc7FQeQv/opuyFCHyDzrRMnpKxvKMLpTjZxbwJOwoxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDGmnVtVLk10cTWgZqwGOh4xLnuMQITNJ+Di0P9rIKE=;
 b=o7w3+a2p/nfMDabJyTktsaLBLdtZxIzCpVLUxm/EadQk10bqe6ZucEHeWlmU6DfwejqF6s0BdYsmP2AWvt+RoNAcF2uwqGfBpYt0aSlFnsYFr94ZIx3sma63QV+6PcB6gW/9syxbK8zfLzuFUXQWSGrivpiQdx2uY9N3N4/AyByvYLAxi+2R7NEG40p7ASgcLE1m6Ptmi0X60AucFYTz/32pLtyq/PK1QU3RQAYPclJK5eQ35YDYPNkueDs71baYDGYoUXbEWJ/YK9TfIsLQo4vgi20+7S2O2jzgOVpxl66SQ4x6hN7oo3281kZzKmINH1IoCc7dabYHU2lL+RUINQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11806.eurprd04.prod.outlook.com (2603:10a6:102:526::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 16:38:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 16:38:28 +0000
Date: Tue, 18 Aug 2026 11:38:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiawen Liu <1298662399@qq.com>
Cc: Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH] dmaengine: sprd-dma: handle runtime PM get failure
Message-ID: <aoSKfDed29xf-nby@SMW015318>
References: <tencent_72CAD47A90A208C873DD65A726C0A15FC107@qq.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_72CAD47A90A208C873DD65A726C0A15FC107@qq.com>
X-ClientProxiedBy: SA0PR11CA0190.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11806:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b8ae53-d76c-43c0-8b9c-08defd4721df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Fj88lqXV+lqbIe+iBq04iwMylWKF/9ur/Lsts/727/85zzx6xN3h386Kg11U8ff6HaS+GuBfePOSQrNwNDCttZdHBV4nKRjbKMQIWyS6Vr9qmLZJ7e5yIIEoeU5dZlH+0m5AC5WQLCXEQY6mDpDb+wiSQUdR2SDH7PaTyMdAaYwnnafKgarBsJ9Z1bZJekwS0ytbdfh11NnfSpmufLOU/v8An6pxh/ekUv7Ribqe/SKawdfV+/wO+ltJkKVkF6M7FG/yxgrL7aFvW1IPgNbCVCV4VxsIVj5O5F/vFzj80v/9p9+qf1nrGmtdqDjaeUlkAMd956n3oAkMq7ldgar3+980SCy3HrwXrPuQcUVecVAWwuAalgX3NoC8tSDOZ3NZGELDsrwt/1n3Yv3WULBtMR+GhlaGsNFfpLyLqzKHgCY/hpEWa5vmqiZM8Dv/NcBr1OYh9ngOdxnXIf55cPWRRHgO97ZbjfLEI5BmJTbtFN/RuZ1cnnrITfRq3hpP2JKrKVtPV48WrxcjGOvIUlYJ54qvkjrQ+kLKM7WBPRiGZtgl9qnbminUjn7jh7DTLmmGJmRGVdVlucXu2w8sqDxqtPHf77Hd4bCTRMon3vgTBA/iCLEEwkKriWxGEypk8sLJ9M85KcPG42s1grHGNcroGyOTMKrGwIgIYX4bC8tsICw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hs3LsArBWL2zEFeoyvSiVb6HSaYZQkiZzW4MbuutLMHyUG0zHWnN7U1CEkDf?=
 =?us-ascii?Q?mOpz70w9kmy883zrJXH5Z6gY42Z6x7jBrggpoMrEcKPg0l8Tjp7Vwgi5omUF?=
 =?us-ascii?Q?w92IiLrI1HYG2LWl5/DmjSSk4Z6EYrLhLjrDY+86ogbi61C+JzjpNVwxsQls?=
 =?us-ascii?Q?nBu9meZNYDO9ghoSYkOSzzX8vENfTEPlFwvtOC3nDrc4tZleSqu1EugmgjFw?=
 =?us-ascii?Q?VlTy1vEsJ7dpCuCvxPZAFk326f7jLJjtLr5wFvSIF94CyxJ46UY/hjzXYUcS?=
 =?us-ascii?Q?bsLeT9+tbMtRx2nCu4lIBR/Z4fNWVs9YqBK14FzJ2KK+Fx5rB4fNV6GbkUbZ?=
 =?us-ascii?Q?IMugSSakeQ5SfiUTkHtYwSWrteKVp6Kj1bqKmblE7tarjGgIWUc+k5jPptVn?=
 =?us-ascii?Q?Kruy8L6K5bRGvQf7ykNj3hflhpbzl29D4zuUyUrvdRrmphrubodBACzIEktk?=
 =?us-ascii?Q?TYz8LXAde4CIX/TIvr3RMNgpnWUPXTuh7wXPWx8MJbaYMcpH7cQULJLuclN2?=
 =?us-ascii?Q?9RNdo+fjJR0A+cgS0OHtGsoMfLruilLjZymtQS26bTlxmJAQB84k3BKFlDV3?=
 =?us-ascii?Q?jRS8OcQnd1NXLTAtu9Bfn+Xx+Qrf64nzmM7AHidTsCcPrrMJ3GAjho6nVPw5?=
 =?us-ascii?Q?Vsk01ZPxTlg1EqIjMJRuvbAvW6iKX+s0SBAHzJFnnBiNoYOHINmMbB8xuE+J?=
 =?us-ascii?Q?ovlECdQpLytzwiQ3wPs3KjQaXF/0etJIDmFryFF3MzMmSumF0oolhicG2rRG?=
 =?us-ascii?Q?Q+8TefnTHs8UW4p23SxvdFC4c0ai2XULp00QUKTxqtRjfm84dmRh49Cq9dMl?=
 =?us-ascii?Q?/F4zV17fkCoNHU5OWcGN1H+/pnHip/nYOpWIPNXfmGgdg0PRSuZ7sckY+VZK?=
 =?us-ascii?Q?CjHG0DzTPC8n/I7fupYhMCwOROEFJ7RACcm1KsU8UWAxoeS2FB9G1P6sqbfJ?=
 =?us-ascii?Q?vieTu4+m1V/M5VeFpqKP37mnrVokd8pYUs6gLrhs8nFxtW7liHk1mB4Izwhl?=
 =?us-ascii?Q?v9Hv6TI7O3xdIsxfIXyXRaNCg4v7GvfFHju7cjeNtiLsm5Yzx1BRTucp/D7B?=
 =?us-ascii?Q?ByY6MgfAgAZo7Z2Byq4/DiZzC3tMHXTcXLm1TDbUzZGUjsUcFR2kU+Bovf/I?=
 =?us-ascii?Q?YuptzX2BXJWwKJs7y2faPBgE3AJInxfVwGizc1e87qJ9NZ3FZrFoWEej+wga?=
 =?us-ascii?Q?otv5n7aQLdsDTcu2IFvH3iLbKZLDtQw3Xn6JHEV4snfGD/8GSTOh/Q4yQGkf?=
 =?us-ascii?Q?o9F36NVXIMVYMNnJmNAxKP6uQvt2Wl9bBF9mlAE3gIEmVmqrXmhR0pZKvTzC?=
 =?us-ascii?Q?ZIOg88yo923mg+LlBG6vIsSaERbqpVPzg3AkleajMPpMXJJTyc0ORiteDRN6?=
 =?us-ascii?Q?Or3vx/5h1yUVHvX4Atpd1ASEGiGSfYnpaJIXrl/6oQY8oFPeGa71zouKy9qu?=
 =?us-ascii?Q?9fhlt0+DqKMTqCtAQK1UJKDF/dez4woQxjzSGwwRpJX0vcYmlW2OlUVLPRTP?=
 =?us-ascii?Q?+OX7oA56APnxHZvogtJXwvfKFccirHMcDzUGCGuIrCwBz97iypEdtd+ZAAi5?=
 =?us-ascii?Q?x25Fs7B2h4DEbrX29GuYDYEcAsiFMeMzXVY3v3HYk+PzPMqI5MWjAdThZtEV?=
 =?us-ascii?Q?bUEypdeZqKVKIi68CTbq6tlN+wn5acYLu5gfea9NFUgjgq8De9clXycISaTA?=
 =?us-ascii?Q?5/wKaOOFYfy9375XeVqlSvk51hnHGXGpYwHheXNDfl4G0abQadU6uJPbmvMI?=
 =?us-ascii?Q?8yME94XbNS5UhukeN3hgXHyCRHT+5mecdg/vXE8n62T51nzNpWR0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b8ae53-d76c-43c0-8b9c-08defd4721df
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:38:28.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4i+PfK4HFrtkXpHy+yqmjCaU2HGatRWJqGylFHmJa6gsnY0dfzgDcCLEWpuqqlHu0tFTUjWxlO6Hz2kyAmtJ8hyNwtTQ8usZJwvk9Y8SeiRkS/hjbfg1ZsXSbUkKNA2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11806

On Tue, Aug 18, 2026 at 04:41:24PM +0400, Jiawen Liu wrote:
> From: jiawen <1298662399@qq.com>
>
> Route failed runtime-PM acquisition through its existing cleanup path.
>
> Release and disable runtime PM before continuing with the hardware
> teardown, so an unsuccessful pm_runtime_get_sync() does not leave
> runtime PM enabled.
>
> Signed-off-by: jiawen <1298662399@qq.com>
> ---
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1212,7 +1212,7 @@
>
>  	ret = pm_runtime_get_sync(&pdev->dev);

Use cleanup

	PM_RUNTIME_ACQUIRE_IF_ENABLED(&pdev->dev, pm)
	ret = PM_RUNTIME_ACQUIRE_ERR(&pm)
	if (ret)
		...

Frank


>  	if (ret < 0)
> -		goto err_rpm;
> +		goto err_register;
>
>  	ret = dma_async_device_register(&sdev->dma_dev);
>  	if (ret < 0) {
> @@ -1234,7 +1234,6 @@
>  err_register:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -err_rpm:
>  	sprd_dma_disable(sdev);
>  	return ret;
>  }
>
