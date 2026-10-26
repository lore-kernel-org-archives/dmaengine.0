Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793033638;
	b=UdfIGlg7zLHtQEP2qVekVEg2Vl3/DbL+LON2JB2HGdgVOe5B6429op9RZ1y0tWQg/MAN
	 eyAxoMxqbUdWbxSVKPkuBDi3v5J30iipXPQm6uk3FQGWoAdbKGoY191SBkJG9wTtk9VZH
	 WZPBdimtmMgDRCpYHW4XZLs0bjk7R2WkorZER8eregH9HsQASuEWOQ63mKuWFPab7d3x6
	 iAe+IjGvviIenWLmtX8ZkHRlF0zQKeQx2ecvIsVJ17MPBak9Px8ACBcdj1I2ftfDiSQyv
	 vtP4F/93+L6mukcxzZMEID4E/bGSTjOMaQPlZYyQzBiZKDT+nYmzIFf6t6vkgbuebdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033638;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ekUON47Apr9jxYQ+WLZB2ycXKC9CFYI5hF004CfWqlk=;
	b=TKXRBC0NV6i+pmBLwL7yaHGhwhRxy47N4TmgI4qXs+rnp2vQglkMgnJkcX9XxzvwHLTB
	 Y619CGxy4NuytsTA11PRJxgFB7ftAdWVC2PzFksDAEVRQoDQLdn+LBhVWmWoGbnL6M2Sq
	 lblyX+mYBa4bqQFkCieokeqN1Oiek4+2FikF5ZoC3aWepbwhUhbCVTOfmU8YjP9jVXUQF
	 zCUhR6JsJbFfGASTkXP5KeJJjzfBDxMOOsRWCBajHuyT80cWLoB2p48A7pz4Ny5zvFazn
	 S8Hbm7vYRtMccRSMed3yENPLz6ifQkQfCKfIIeXkCHNbQpqk1qtVXcXCzCIdiO8CoJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OermcisV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.9
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E68B606A31A;
	Mon, 26 Oct 2026 16:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E68B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OermcisV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbq9jGF2DL2ImORPIngeIT7gSk39Re8g+bAoqZD1c5ibOgP1YxlRvZ9RW+6GFVE3PnD/925kMv1FVPchTRf15bfx8yTHLsHyNktzBYk5OlvT6G/wPbjsiybUfQqvk0LXM5Cz8j6qok4jVriSciaCEXD610571PTZb8e7d/bn+2+v8w8TS2Wda6CE1qQCO4/BEcC99DZ4WP4ZN086rSbg/orNKnrc8TK/+xcc3BrzHpXrcocJL6cbNMU3fnr9kI9giYhBnIy9twxK0rX3EwvLtInVGAA7gzmHs9K8qlEku7z/JA+igZ5LMDOFRiIeiqT7mqWoG1GYffZF7r1gqVYphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekUON47Apr9jxYQ+WLZB2ycXKC9CFYI5hF004CfWqlk=;
 b=I721VGM36k5oaAWdG58RyXnwOPFhZKAtU5/VhaUJjqE4SrJqvJYDQ3MzHe3Hs6886TRJVYTpTVH46/Qg5uz2gvHqJ3cy+W58PQDU1xkglcWgxTRDNscY65O7A8Po3wD+TpqtlRCcfAOa/nwlzf2WWMLpK7NQdMMgZt283U/Ivte5eOJM5tuQw3Fr3vO96dgDw8OO5orEP2/UCLVDMpGo5zsvon7wedvT3EgRYI9ENN3YxZ57xUxvjpE9dqFvbxh2TKPMACaIfH/TE4nI7/4D+NBlXRBWQKeGkgk98uBARA290loadBlc1sYgQh/GI5GbsiS0Un/7aAUyccd4feCQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekUON47Apr9jxYQ+WLZB2ycXKC9CFYI5hF004CfWqlk=;
 b=OermcisVbtycZIOmlE7JjqF6sqT9CDgrSle/FjZG35Z4fqhUazkEDk6vkMpmYFroUgmmeLgT4IX8WcML+dM71RgxXR0xR1cj11nfaJOHokCVQh243uI0yl7dk56QOzJIKIyoCOF4xREPOqr44qgffn+TigIs2pjLfW60dFPpC6AucGA4/kNpEKQwSfzdHgN2OXEfXEab/cvs0XI9ZLi84qphW8BUXtaLqu+BgQVpyTVxpnE5WZ3ZZCNfjFZSlweFOi4b6iM5XV/ztl8JoikqNw8xDjCRWXEd5WomSe5ZU91F00b958A0yp3f764qjOfZkwxuo4+ZpgreMoBr2L6rfg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10340.eurprd04.prod.outlook.com (2603:10a6:10:564::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 16:53:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 16:53:54 +0000
Date: Mon, 26 Oct 2026 11:53:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: amlogic: Fix missing destroy_workqueue()
 at error path in aml_dma_probe()
Message-ID: <at-FmthARu1uVlHQ@SMW015318>
References: <13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr>
X-ClientProxiedBy: PH5P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10340:EE_
X-MS-Office365-Filtering-Correlation-Id: 6986124c-fea4-49a6-a141-08df3381b852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|261026140227099003|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261021123027099003|261022105027099003|261021121427099003|10067099003|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	s+v/7NSu2phB/zHaAMTvEO63lL9lEl7b5vXbJde4kYVrlYoTMuhUVEKZyRvmacp0UHkF90FHWx/lQNQo5JGvKQkOH5AJX2C8D88B7FeWuqvdHFZx7RpcyHglvJgDrEzJ4cLqdgfq7ccNMUGUnmT2c4tGQQw8pSNp384Hxdu7iRCidRInkuu7mO3OdRpxNPBzWAfDksrbZMtCO8uSUPnBihJpxvfCjkNu55Jeuvd9g5A7J/VNf0ToAntHa08PSE6yqQBXHBR9qnSwqWmjXBhzrDbgWt9QYTuzIgfsgMgNkwZjqzlvmsIzShAb5wRgtA+yBm0VTefuL5V/m1QYvWLnb1jhnwT5es6mVhA1EYLKQIxcF8gAUSSAydn9vBGizR5whi3v2N9V+0buXKjFxqBY1tO3dJlrfgiKmCAdmhQHkqMlvMeysHnrhraj+iGx87+CU8bPv043GIeyMCYu8XalEZ94/WPdxJhck84H7t/YgrmC69B+/YRLGdyEMZ3d1RQH1EORgfKGVUEWHqJkmxUMT7cJTdPCbymC/nPrx4sXoKvRQfcUjlDzaCGv8o4zYTyumESbmhNX0t2PYgSsDvPBq1nf76pr0d7SruVBjqs3fbH0mdGZLo95sD7Ee9k802ok
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(261026140227099003)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cp1vKrHWmvFmZ6oRBMpnkhdUSeuCpKoPBCooLu1Xh7EztnbSBdAvtT2L8NKU?=
 =?us-ascii?Q?F27CK2Aw5IchoPOkeOp1v4q/NGfcpYzzPBN1SRezOGrHPRT7qBmkjxf7Lsjk?=
 =?us-ascii?Q?EPum0VqY/lehk11/zBWsdADygX980dFesX6QclkS2cmfhKU1G+iMAHXNwsRc?=
 =?us-ascii?Q?aRAC+5l2vtvimXJmz8v8JICCkZHgdHR/L8d0ImkNkZbvIBNE/I6LqimWENxT?=
 =?us-ascii?Q?HQKlKmnct9E6a5VkP4mR70EU9A2WCRy4Ltw048HL/uAjwhH7VncpqqOcNnmm?=
 =?us-ascii?Q?KwOKVyTRs+u3yLCsPZYQ+oV0DVen5vdAIb0MLsIM+/noLwbqB/LlWxXdfkIA?=
 =?us-ascii?Q?WqA3GalZhOXZbtT9pCOYW3ehU+FtxMxriVWNOmDLk8UGp8MLyDTYzEfh1eaM?=
 =?us-ascii?Q?ni/P+NwtrSXXPTyExHiJj8FzrgeHiQfXJpBDbw0cEb57wGLgOtmoHk/bFpxY?=
 =?us-ascii?Q?gmH0w5ZAJ00tasY9DiT5hooi61Ir4HFF9uHe9afjaFlrP3ya9nWWgNvEy2TZ?=
 =?us-ascii?Q?75vcdbMUQgnQq0TCd5g3kFyT9N/L/rqRoTpcPB/0YjFbxwEi/NY20zyvJhLO?=
 =?us-ascii?Q?pDND75lvHT4LDBdH9fW9IBzWXoHhImRUxJ6gWnjk84EPxvE2IAPhV4iwHFiy?=
 =?us-ascii?Q?EdU2XjA1rVsoK5rePIubMDlIqqqk0x4GyVkjO5si8IkD2cPP+jptQ/kYTg5+?=
 =?us-ascii?Q?ZyOYAgAOxEOYsVHibjxPvD0BIC4HxAb9kOg3O0OmvDJ3l0gGfgd6XYza5wd6?=
 =?us-ascii?Q?jkWxGl6Yy9F4HWH7qIV2mFVuSbT/b+ecO2NmKIIBgJ8zSjmX+vqw3mqzGWlq?=
 =?us-ascii?Q?dNZN4UMOvi6m0vLDSaUTGlGfZCxigTp0RosdCUlL1p1OpVkwoaJLIpHO7GWc?=
 =?us-ascii?Q?wD/LqX1LMAcm2+/WSDGGB+Og2dCy99xqRa0RFioG4O/p2s4bC3XOhpArmiw6?=
 =?us-ascii?Q?iTn2cZfPSnLJ3Rsn55nJ4hv5Qy7ThtEZqVX+QQI0LnOU5UKiTUjBs3qsH7dt?=
 =?us-ascii?Q?MGF7X5l5B1sTNqcZnji8L7Py8LSPaOCdgKnkJgn9kM5NoheVb5T6khGx4av6?=
 =?us-ascii?Q?CUAsBcjdtRn9OEXtUCWGh9mQCYTx2HF2PlS3oYmVVz/KOrBwwwNvVeokJDA2?=
 =?us-ascii?Q?mho9U0dY81Pyd3ucGVzA/kfNYMRrU0V+/czqR7oyZanMDYhBjTe34oGu7lzi?=
 =?us-ascii?Q?VTu+sn2KuyQK9zKHtQhIhWYuakVvVH+fa/Vu6UMknwJuBFR+LnCe0tAwJPGk?=
 =?us-ascii?Q?ax3zB7KQ8QEe+8DXG9E6PxhEl1Zte2HXf8AbotV4JoAooMa4K3pssi0x6y1l?=
 =?us-ascii?Q?cREyULs91Sql+0DWoYAm4Dd5FTWNA/0QLwP9eb9hp9Iq1T2a9/ryUX/mvF90?=
 =?us-ascii?Q?TlFvs6PgHKseYqSsO5/wlovCySS8JXFyyWhygkplAjd/xhBkVvjxdVW02Jk4?=
 =?us-ascii?Q?X5wAD/RsHIEHDEUaqr8paml8AaQAlfmOSFdXNnGpIx1wOW6JSytHEsSpcptY?=
 =?us-ascii?Q?KncO6s5ojRgoDDNDrsvuqa9FQQm9fdfewn9r8KISNvrBYvw+cY4ercey8cH5?=
 =?us-ascii?Q?BOKalIeS7CaGtr6dfvo/MB1rnU8eGc2djQjAZU6epBkxCRCzOWQ2mmbDJhok?=
 =?us-ascii?Q?ufAs9A30u5wdg5uALB6wGj/xtFroeRNIk1WmPt8Hp2yMNQU/0OSs0Er2OG4X?=
 =?us-ascii?Q?hYJrPSc6zHy/JLO+aFvvrobPGWrUSExyEsB7YkkAXqaTgxGKFRHbSFTYS1H9?=
 =?us-ascii?Q?xhpOsmmx+M4ciBsskSiJV3lYBSdGT/gL0WvdY/Biew/xV47IFRyk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6986124c-fea4-49a6-a141-08df3381b852
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:53:54.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4ZorFKPcNwtaxy5pZOXQ2E6c0HMH1+Lx/dAcJXnnCLoAjTXdP4b+fu6gFVa2XabeMxdIhLlTMAnQIkS2+kF+h4YLD+D+vTPbspPiBnC2aTOap59gJ+FMHBLY27ZzG0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10340

On Sat, Oct 24, 2026 at 11:05:13AM +0200, Christophe JAILLET wrote:
> If an error occurs after the alloc_ordered_workqueue() call, the
> corresponding memory is never released.
>
> Use the managed version instead, as already done by most functions in the
> probe and simplify the remove function accordingly.
>
> This avoids the leak.
>
> Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Compile tested only.
>
> Changes in v2:
>   - update the subject   [Franck Li]
>
> v1: https://lore.kernel.org/lkml/93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr/
> ---
>  drivers/dma/amlogic-dma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> index 684121d13fca..791bd82743d3 100644
> --- a/drivers/dma/amlogic-dma.c
> +++ b/drivers/dma/amlogic-dma.c
> @@ -620,7 +620,7 @@ static int aml_dma_probe(struct platform_device *pdev)
>  	if (!aml_dma)
>  		return -ENOMEM;
>
> -	aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
> +	aml_dma->free_wq = devm_alloc_ordered_workqueue(&pdev->dev, "aml_dma_free", 0);
>  	if (!aml_dma->free_wq)
>  		return -ENOMEM;
>
> @@ -712,7 +712,6 @@ static void aml_dma_remove(struct platform_device *pdev)
>  		if (aml_chan)
>  			tasklet_kill(&aml_chan->vchan.task);
>  	}
> -	destroy_workqueue(aml_dma->free_wq);
>  }
>
>  static const struct of_device_id aml_dma_ids[] = {
> --
> 2.56.0
>
