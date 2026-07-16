Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013065.outbound.protection.outlook.com [52.101.72.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C59437E5E9;
	Thu, 16 Jul 2026 20:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235469; cv=fail; b=pOobje/rTMyFaVjA9cLeLlWSSZXd1hWqBD9EhqmLEN/iA6n73oeiMqcmMf71OWocPQwImJz4fPIvRMBgfNXT0Ylj2qypnyEBqlcd0OSxnnUSCci+aXOFgWCEo4yJIWCT6/IkblOxqQqyTGpJV1d7L6Q3YXOAdt7b8BNiboO+2hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235469; c=relaxed/simple;
	bh=Y0+nWZEKVIgQ+obCxA8z+30Sst6NFiET19p1a4QA09g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZWJcFklMKJrzWdMR5c4faUXYlYH5Cy3DoZOwyqXnN8Eoapl1h4k4cGt1Fi+xcwbuA2Hr6htQPEh5eb/+BQHfbC+6wQOXXPaEJpd2G6dKvjNSt+xIp6JHfJg85rhVRrYqItP9xaADww89Ck3oGRPSG7rBltVCEKMzlbQhJtH8aUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kntAHUxL; arc=fail smtp.client-ip=52.101.72.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kntAHUxL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f77XxHB0H9oXlLeAmtyIqJkYACYErWYXaQKqsPQP20GscFlNUs2yfXS3IqKFkeRsq/lVdzyd2YywjRDJ+TLAKkKvlCU0oZw0RYDLzn+iM21jVmF5lbWei9N5RHGVW1YwiXybcjU7KzLWdkD0K+dRm6mhgfpMCSZqXfw9vhRneFqBFNpqcBHzrzHtNDHK/i9aCRNtsfk154vr8rFmPzjYSYZr9V0n97z6YYclz6XF4KgYNLlVMAl1OFZEd8vD8gmRf+5pYWRrrOmsXi1YMysZ7CgdDs0BlCnq2PN2cDsoSqQt5Nx0u+6MAsC6Fcdz+xaE4AcNf8ocagHgjZONH3kARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHTAfx97tfkPNcHAaG7u6I58qBoIY/M4VeHIAjp9/gw=;
 b=LDg9rL69x67Uj9MZStW6So8APUMOcSZLXa5vCNOll4+ULKU5x2T7/N771NP2FwhNadpTGyM9molZ/5qeU4XZzDvT9jGiUNJbxHQQwMdp0QzL4/7NoHEUZESYlmgOWV3xklFhwcJ0H+kc2OAMp8iEQACWzhtQKIKFxnzwBI7SE1dciit4x/j8kmcJhlAzAEUpHolzQ/O0o05pLrlM5uTxrLJfIpn3NKz6rc2aRLirDlqcbxw+yBe5Bxag/nFWpScgtRqIaI4zZC9D4XWa7ai41xJr8s4wxSyztEL2rSJBoOuLCH2ID80THWstx1AqwgSCHc7pw5OB+URY2WyevNKZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHTAfx97tfkPNcHAaG7u6I58qBoIY/M4VeHIAjp9/gw=;
 b=kntAHUxLUczTw/DTRW/Ym04Z2FAdFzcUbf89Wk5r9lnWXX5tWF4eSb8evAfRS9Rd+r2i6IeU8dGYzNOExxcItCwoEVciHg2KQW2j+THENCyk/nrphCISKpHrpBeYP77xF/HGloC1ymhGpuwiC7lXz9/qsYi1SoWkNo46MswoP1DRtCiBbEH+q1a7mE4iDFIfrwyVSuxy9ZUAMI4/AcJFc0h0pWARRUBTiltx2Cu8lWvy+lvQsO52Gou5UAlmzbVo9+22+gp/SnUrcyQiT9KFHK734UWpBHO1fV+89Td4dmfhUQnrsYmMQyWyKdOeFgYZ2mMjWHFZzlzueb44tX0dLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9984.eurprd04.prod.outlook.com (2603:10a6:10:4dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 16 Jul
 2026 20:57:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 20:57:45 +0000
Date: Thu, 16 Jul 2026 15:57:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 2/4] dma: fsl_raid: set final bit via fill_cfd_frame()
 argument
Message-ID: <allFwqJcks3JixOx@SMW015318>
References: <20260716202949.677290-1-rosenp@gmail.com>
 <20260716202949.677290-3-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716202949.677290-3-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 714a3a5d-b6f3-474d-b425-08dee37ce297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	+bRnt0EqfpIC6g4JqHI7sUMEeTQQPskdLZGRG0dapAsbxRlAflsmPE72z6APQpRkr1AUhNmhzN+wo7EJT3pJ9/60PCl4fso6MGntnOC+jpNFZhwH+kmorgDUeoV4ZPqDnEvYVxOMe9NTI73AEcKud1CWefW2dUd7lnghKQPk5+sKjc6PEkxQza/tn/cMcsbiHTa6WZ1XTaldtEe7FqrYptvoxwBnD3EQHlkld+AgqwkmvHuHCgKE3i1VWdh6c5s/CYBUH1h8HefHlIA61PKXNXRF4JIGSJ2QgEx63d/9gZCnit26KQ+NRYlo12ZlWOoN81Q/EdSgBaPnQnBpJvIXqnyf7L37O/YqrMIwPiNoAs3MKpMwGliNG9Ecm6EKEani5nmQn6+mjcSbH5Mt/tF71kdPg7z/mhMZaVd6S44XNBBHsmZBE5qOKkweWhaaeYK1NjrAX2+yOGFyPNMSXrKz4t/qOflyUYcEK0C+6h5aUQB7be/tqtXi5KOdq8oovORLguvKmuSN43kBRq2zh34E2Gsb3isDkybRhtgqnETHyvZ3unTq8jN3bFKk7M6RPG+9SAH3w6Vf1MgriQRu4/4EyEpFGHGvivukBYQXKURV+8XRjrj9fE1QVX/A6TxKqVfdVRyUtQaW/YrUrpO64kIg1oiTiXIOxwJmEX+NRKvUtz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xF1Kd0Kk3J4KlnESQW8HYsuyh7affJIYd7DNVwy3UwyXfaS+jO66WMsPn63E?=
 =?us-ascii?Q?aOrV/w2Gwebh7+UUSC9aFpVhYeuwTvuvQwgyb8Eep/MjozWSlKarQ6kSZBvy?=
 =?us-ascii?Q?vWPT3moy3j9lCtGZfrNfDerDO4jVh6RYrV+4CW5uhXZ2ld1dZhLKoV/l22Wd?=
 =?us-ascii?Q?kWNYRGxMIeI4ELHmT9QzLVKAy07vCfs0gfyb5KJqsLjiyr3m9oWZ8/T30ZB/?=
 =?us-ascii?Q?4MH6Be2YnF0yusrnLG4M5+GddvNxqkKawoqEYhxC+kGNqyv5P6LBfDJkXQ37?=
 =?us-ascii?Q?3hPyx1M3MV5Jn6zZDQAzFWIwwUs/S4hgi22dMYS1JpZj9o/0sUNMvtPWwgag?=
 =?us-ascii?Q?LheMtMdj9YFDqHvKw0/68Otqno8zQQqnNZS+VZP8OrpnXbpUth/MhVhE4AEY?=
 =?us-ascii?Q?MC6UjDcIsjtXq7cXwPaYAcGKxqjIuwTYSjLf/vEIcO3YPkhQhqj74Ms4logM?=
 =?us-ascii?Q?QMFbnmvRydlHUA23hlL3JN9iTd5aRwAtHvOzvfpPjQUCqzIi3FLd3o9ZHE4E?=
 =?us-ascii?Q?0nhjEU9pWllhkoAf1/6fSvQng9hJtHJWHpKzbaHidnoNBL6DDZowb2xWFLPG?=
 =?us-ascii?Q?5XYqrZ9HVG1qeiikKWg5cEbGz5VPSWd/Q9RQkrUhqB2x4OKK5tF6fqF4cPkg?=
 =?us-ascii?Q?W8PdYOiJFNlODIPRdUVy6+gQv6KZ8FsreGhb6YXIi/9/Ma3H2l6Vk2GfSMBK?=
 =?us-ascii?Q?eeDFEcGdZUqV9ds9+2QbKz4RUSgGS8nUytxYRtMHOQYBX6n35+weiwawACDr?=
 =?us-ascii?Q?IsHxh/87K+wdpAgZ32h31GXqVeX4XsWX31ohliSniEUjIUU7WCRLPGpxciCo?=
 =?us-ascii?Q?IAulWlGyIlzASq9Z+TE2+nN4UryqUCAd5XAI20m4JRXIDZlVKBZIBSOeXd2D?=
 =?us-ascii?Q?qYltTsvBLqyyg6xhPomEwQNs7iyP8fm1Do2w/yzIM4rN/bngiKbohp7hRWwf?=
 =?us-ascii?Q?7mxpyqP+sgb5fkYAdUiM8+e1muBqliCN9REZYjC0+RX9lpXcn6EDQSPwzH0e?=
 =?us-ascii?Q?liVj5JMf1mQ9fx0RZGnHiME5TnVuiun4Po+USDDp4WrYerlwg0nEhvOqcQlD?=
 =?us-ascii?Q?SCQ+2vQ1c+Qpu7i1sEWeMKdFhotWrCMy6ycqyL+/dn28TwGeU3SzzgysgJug?=
 =?us-ascii?Q?Md+Y0Mrpc9i7uPWw1cCJ9MzXcZYK+l/zKIFwQpZo4jLpnqTglxbH/q/JCA+J?=
 =?us-ascii?Q?Fm/NGdPipYorxY7IFT7D7p70JCvYXLttHnv11yGYuJrVe2JxLos++9OxLAwB?=
 =?us-ascii?Q?aJY+V4oRfxFOPYy/6xt36RQ9gWAgMtJbFi67BYXodpO9+jsftzM77E4B7PSi?=
 =?us-ascii?Q?iQT3iHfXEXdJIQt1WiUwDRMRi8mKfg1oRMRUY0+69EoM97JNba5A/djQYTdg?=
 =?us-ascii?Q?Lb/lTT+1lHCGbCBvvJN0KFa1O+zYuM0KFOE/ewsBd5Fj+ZrEBFRlwvKnKaRW?=
 =?us-ascii?Q?iWah9Tjh+WBoPL4kGxk1e86U1CKWhxd3UiJbzqBn2cvPS0jsRbhjzNLmcA7q?=
 =?us-ascii?Q?TbUP8RKmvcvdC6ACFHe3oa8nj2UGZfVQfBAuyWh8tCScK0WtgfvZNpo3hMAX?=
 =?us-ascii?Q?r2WoQ5iAwizkmBYmzINn1wLX9HvaJwq28NpeZ94mB0FK0qXOylUr3a0cXBNh?=
 =?us-ascii?Q?ONU/jODThk1kVnaj4mZu6Fj5HG8xDZMwPEKn3LxBC0DoeYDEElk2/Y/Qvb4V?=
 =?us-ascii?Q?Jl56bbQLx5nQoIbjLTbkoj8THzeeLCKmOXSDm6v2q7X+BZrd5D/TY/rg96Q6?=
 =?us-ascii?Q?HClv0izXm6vNBjsOTgCBxmdlptlETxaw7E69Whj146AWFNrzfbAS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714a3a5d-b6f3-474d-b425-08dee37ce297
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 20:57:45.3213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83DDPk5uSbfwBokRtWr0gakZSSpR3qOfMtLTqui312Ka/LxcldzAcQuD7NXSunoOxMOD7XumIN9Ndd87WTP/SlFE/ymxkuOUWNeys09MSoWOfx+9qSNGh1UO0VRwR+RB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9984

On Thu, Jul 16, 2026 at 01:29:47PM -0700, Rosen Penev wrote:
> The final-frame bit is now passed as the "final" argument of
> fill_cfd_frame() (as fsl_re_prep_dma_memcpy already did) and set in CPU
> order before the single cpu_to_be32() store, replacing the previous
> read-modify-write of the __be32 efrl32 field.
>
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2778d07a05e8..888f55b672a5 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -375,11 +375,11 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
>  	for (i = 2, j = 0; j < save_src_cnt; i++, j++)
>  		fill_cfd_frame(cf, i, len, src[j], 0);
>
> +	/* Fill the last frame and mark it final */
>  	if (cont_q)
> -		fill_cfd_frame(cf, i++, len, dest, 0);
> -
> -	/* Setting the final bit in the last source buffer frame in CFD */
> -	cf[i - 1].efrl32 |= 1 << FSL_RE_CF_FINAL_SHIFT;
> +		fill_cfd_frame(cf, i, len, dest, 1);
> +	else
> +		fill_cfd_frame(cf, i - 1, len, src[j - 1], 1);
>
>  	return &desc->async_tx;
>  }
> @@ -505,16 +505,16 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
>  			p[save_src_cnt + 2] = 1;
>  			fill_cfd_frame(cf, i++, len, dest[0], 0);
>  			fill_cfd_frame(cf, i++, len, dest[1], 0);
> -			fill_cfd_frame(cf, i++, len, dest[1], 0);
> +			fill_cfd_frame(cf, i++, len, dest[1], 1);
>  		} else {
>  			dev_err(re_chan->dev, "PQ tx continuation error!\n");
>  			return NULL;
>  		}
> +	} else {
> +		/* Mark the last source buffer frame final */
> +		fill_cfd_frame(cf, i - 1, len, src[j - 1], 1);
>  	}
>
> -	/* Setting the final bit in the last source buffer frame in CFD */
> -	cf[i - 1].efrl32 |= 1 << FSL_RE_CF_FINAL_SHIFT;
> -
>  	return &desc->async_tx;
>  }
>
> --
> 2.55.0
>
