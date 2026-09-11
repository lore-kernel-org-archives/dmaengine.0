Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3611145B27;
	Fri, 11 Sep 2026 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138610; cv=fail; b=mCr1eYBB/IghqKd7tBRbnKN9mNsVWr4XXJsQuWX06E9IcYCFtaBCNp8Y8gTlC+igyLv0m3cjYvOmAeJleWQ2i8G0LjvSR4VOrt4ctkzPq+yNJ73FAC5saL8ZRRBPkwapsvulseX/34MfBGb6Qo+srMDmPDc5rvI6WCh6lZd+WPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138610; c=relaxed/simple;
	bh=0hjdb0SBOEOgxMgFw+bkm4scTiK75momA7YnyIV+I7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HvZIRepcm5++6dpqEypvY4DgXf1FsVxBAwixKCSrJToyMx+/7hdmXPfx2CxloChk6rbIYD9cU4oM0Y6J0lD9FARFn65R8ea/Q0IfdQkZN7qdnvWNPFesnDtCvfgkzEmAXcP/S6hvf7vdu8R2bTcN6C8toKsUH5P1pIU7AQJEkz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pZAXWvbg; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pZAXWvbg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ho9uKuoiO8e1/U2zamkIrbGaGJJCPlrX5Lhq8LFue+2Lcg1yo5s1aka7MP/8LN6cwpjLnmAABJ9yE0l/DseoorzJ6Zk7mWvVcyxp7L7ceo9Q/h8+tCPfpafo1d69fllVABrMOcd9rsTkwJ+ssWl9ND9AM8NViRiER7MorR097wDfh3mKAz6eb3MYk8ylzGEb9yz8qwca+nXIItF58Fs4fP7cMjWRor0T7x1fHYbnDodyeIhyG6+xsasj6QPj7iCfmnFYZsawNKl/C1Ybvwlp+nFSbZ1Jy0ffZsG2jb0IOIMMGurqM4b505KGbJTg74nMPAoOqF64r7SY2nueF/g7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yi85cTHZAVUKFIlkMjNGInUWoVZnevaAuXpsPgRoq+w=;
 b=xnm+bYcJeojzL1egnV76QdJ4UFTydXt3BId8nNXC/3haslZfDzVcHJ0ODpE7TQ5Xa9iLAPWDPeNlIAk31BH9+b8A9p/4F0ubgUiRm04ASSJE+x2oY+J+wIsunFXyjMQFEB+FWVVQNbwTBZx/+4k1pptdy6xBhRje1RK15pdNfQzKAAaCqj37ki0pK+UTxbnvWF3UPkogNifyEjVV2G+Nzy/AGr09DKq7yYF6mCDfNMXgqERe2jNzd3tdP4FyBUKXF3pEM6Y8Lq6BDqYqrrGfdllzqASzv0jAzTR2Io3r6iWOuao9GZ03yD3O0EfeMLh5mPgEVWAY8+jqj+5xQkH3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yi85cTHZAVUKFIlkMjNGInUWoVZnevaAuXpsPgRoq+w=;
 b=pZAXWvbgr1i9Ntfwu4N5S02QBUg+DjfW+9GFqhP7Ggs9lkvKJI0LzekMvquSWWyOfcP16SC1LoUB9WEFEeorfEOO7pyJfx7hX+e8C2pJK2NpxVdXUvuDKbzwW6yUwEzI43ZPlwMjXyXTmjDbVor568nVNzuDSQu+BXf6mn2DUrdr6MDoyQG5G8Y9kPNQriiXoM81sF9ozXe211rjD8v0r9268LF7uLXMlGL0L5zjlDZzEIFzeYqlpH82pasr7vHtF1dELmfFsygEgGTA1Az/osAzKBfaaeFiyVZUHJo0dmGVomuofef1sLi98X6nGVCpUV14HlQWja0asBUa+RLaVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8480.eurprd04.prod.outlook.com (2603:10a6:10:2c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 14:56:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:56:46 +0000
Date: Fri, 11 Sep 2026 09:56:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>, Joy Zou <joy.zou@nxp.com>
Cc: frank.li@nxp.com, vkoul@kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] dmaengine: fsl-edma: check channel acquisition
 before use
Message-ID: <aqQWpnGmv1NxUGcr@SMW015318>
References: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
X-ClientProxiedBy: PH8PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: 68742226-cd99-4daa-1020-08df1014e63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|10067099003|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	roeOnoANYe/CT5y6zFCS9HUvH76d5fRG5vukRMRjEdDnerMD6CCx49ORN1XzVT4+BR2Z2zBPKKFVT9RmokDwJWUpx0XiCBrF2r7Mke6HvIaRJtUJNw83ovcek8EpGHGhTML1N7rc5j11dHeonN8yc0/4sw7kL/YuJsInk41eTMoZQVzfkpaL+qratCCcal79g/NPmN9onRz32nhhRsqiaOhADmd5A5g7K2lOHYpxZ8X5qbnxV66675AoRpNEDulnb7RftBc8HbWouLz+9qppGtDcXwQr7TCFqjX5dY5X21DPy2OOyKLtDAdZ8t2UVg82Qg/e39LezLmtJFVWbuSE2YaMaiz+vfm4oGZcQMGPvPdRX65BJ3WeL7n1IxCrZB8OFs/enueupLNaNHZTvgx1OQN0sekE49gzkSRoSdAXofL+SCDEg4rI+vj20AOTyqf6MmkUUbpLc4CCU0p2RfVAJWzxDeXGNoeRtahzA8nN4Pz930v8U6unqFZuoZNvo5uSgt+AxEBB4lNSGU6MLIHfAjBOuE/7CO4wGHzOJ47ckb4wv4vgI5A+XtVbJxGMGWNHzQ1LTqlgfxwxigFDE+nIovo+uB29EY/KqJJcJxNWPFYorrbg+gXYJGGxiHwTewTNrP2eBD8o1bZvUunBPg5NWf6dm9oG6xIdm6wGkawDVLI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(10067099003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PvPciiFhuXqEN0l/eTi/ctR/UCFV7RSvhbNRh/74tfEelkZtykorAEGYIBld?=
 =?us-ascii?Q?6vZYJcriVbK3elfPb9u8U1pCnzFyckcViyMQmiE2tyKo6BNVXMkB9bWm9UOr?=
 =?us-ascii?Q?BTxxTYY/jQ6j0FVbKHMb7X4pU9Ru+7J65lEiurID36Mgv4AvElIaRs5nHB11?=
 =?us-ascii?Q?2KqzJqULJTWZt+j9oFZ+5QQc5JofkQjOT+PKpboWU5KCQQtg1TZXKy7xGnns?=
 =?us-ascii?Q?Z9py31nJ61xAHL5nA3GLneCkoCHMIg4/B1yzTYQw1/ROzcDUlvJAIgKnw1aN?=
 =?us-ascii?Q?pUGKqayZphrkZbW5d7950g7iWwXEQE/+0XPAfQUIzw/LtDd45LX6gZ9FZ+hW?=
 =?us-ascii?Q?30A43vZmJ90EWoIzFO/O9hrYY1Kssx0RXQgORi702tTYYyX+ETg7oCmVDMsV?=
 =?us-ascii?Q?b4ULCA7o+kCgHhgOaBBYNp68ctIQyC5H0nWxdrm+mgItKODOjzUfbUa93qbS?=
 =?us-ascii?Q?KANOnb05yFixY066bzRgB0zGoTIXYLNZVCtpz0bd+tdB1/1yzPShozzzuruN?=
 =?us-ascii?Q?c7Ko14DyqaxwCW7M9lHJaQeNJG7V/OS0fA32zapgk9PnkLrVD8UojNAzCCJr?=
 =?us-ascii?Q?ty4fP+5gIN/bDadHIF/1gbKCqv6LU0X2ukaVvn6u1+xwuT2VN+uNyqClTSWa?=
 =?us-ascii?Q?JYhebzZOBfsu8/g3PAjNISiD7mq1/wGbzcAAVX95IMCo2GaPz9NUSXQ440yL?=
 =?us-ascii?Q?9MwaggQWbuD2z3PgU5LQVbRUhtvMf5hXTxzuGOVhJe74ZvjVruz02Esebcm8?=
 =?us-ascii?Q?jgAmwYb9tb0ZY3L689aJVVRoUOOH61HV2mCXED/85qYp1+rCs2GBfyL5Sca/?=
 =?us-ascii?Q?5EuLkm3YO4I1+7y3Du2TGqMYJ/aXyaDRohQXQo03oTp177rPJKy0dJLf8Lxr?=
 =?us-ascii?Q?LUlBD4Yrm/MmSUAxq/oc/lbFm1JjvqTMWznPoYN0cnPG8clEcjDw46lw7I1+?=
 =?us-ascii?Q?QcHdVeoAm/8AJY4deBc0DDNLMtuDPj43xZmmS+FjHNpbo+lgH3rrG5iJsmlL?=
 =?us-ascii?Q?l3bZFGDOrK6kSCjoYqBagFreDsMchSxvnldunDyecYh7SmEej70aQXp5Utl4?=
 =?us-ascii?Q?WoH80tymolv9ihRlvSytql4tuk7pbkbO8ej0QdtSjbNAjr36QLNwAkMeX/Vd?=
 =?us-ascii?Q?GV21/Re9QleTJXfek5Kq3EFtJ4rgjgdxdXd0rGLsKGnp0ysC8nsk4rBh7YV0?=
 =?us-ascii?Q?sgt4iz772CZnm0D+0i6wtP7DH49t6VN1o8LNbcXcOIA9pDBd3FH0bVP3FYcC?=
 =?us-ascii?Q?0WNLdyNoqoTwhm0Xmy4vlzSAsriVK5ZFtlz4nh3ONDaOT1ZPrE8kLH3lS9kc?=
 =?us-ascii?Q?A3DwVQDNeqdqw1Vy5fKGLesw0aTnnEwBnChsK14oYM/I+2mhzcpn2RvJpeV7?=
 =?us-ascii?Q?JRJHIeVzMWQyl+6TQkqIp7ZcUnkhzigB3fTRywZ7+6pbF0iNbyDSQwFzOD3v?=
 =?us-ascii?Q?Wj1jJR6cmPIiVL0HATqekLI7GqbLNH1FIKxNxkNcVJIR228VOAjtBajpAij3?=
 =?us-ascii?Q?HEyH5e7mVwelkoIDOrzlS92NQGgR4VWIwhbJ2VZTc7gl05qK+UDvMOy9Vugp?=
 =?us-ascii?Q?Af1pACkCpfi+z7peLcydA8T7SpVxsNJZeYry9B9YSihf9kjDaN5ztDYL/Mln?=
 =?us-ascii?Q?s6pvbzdNN6yq9f9aEZ20PAmUc63+K8/miPQncLC9b1B739LU51bLdH0tzgPo?=
 =?us-ascii?Q?ElzFbeiA1al/y0IkOqyiNJ3q9uJgw1C+yrQgbOSvUpRiVxtKOC+39r6dmKh7?=
 =?us-ascii?Q?AggJAL8VUzSDDIdlOicUNp98ljjAED1j/aIFdNOYNgWcGGcZbmbp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68742226-cd99-4daa-1020-08df1014e63a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:56:46.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LiGc/Vk1YOV5s9Unkp0S/Zsqx6cO89CrUHYY/irvamRNdwhcTaOBku20xqzkDQNRbaIlbs59BhKgMqomePulSRIoEUW3FlhggjZzYaXmvWHQDyRJm6ij4MJKsEm8q/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8480

On Fri, Sep 11, 2026 at 02:09:02PM +0800, Slavin Liu wrote:

Remove RFC

dmaengine: fsl-edma: check channel acquisition before mark it used.

>
> dma_get_slave_channel() can return NULL when acquiring a channel fails,
> for example if fsl_edma_alloc_chan_resources() cannot request an IRQ.
> fsl_edma3_xlate() dereferences that return value to update privatecnt.
>
> Acquire and check the channel before publishing its source ID and
> request parameters. A NULL-only check after the existing source-ID
> assignment would leave the failed request marked as in use, causing
> fsl_edma_srcid_in_use() to reject a subsequent request for that source.
> The channel resource-allocation callback does not consume these request
> parameters, so set them only after acquisition succeeds. The existing
> scoped mutex release and successful-channel return are preserved.
>
> Detected by static analysis and reviewed with AI-assisted source auditing.

Add Joy Zou, who change this logic recently

Frank

>
> Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  drivers/dma/fsl-edma-main.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index d9fb717b5b53..6934ac882697 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -326,13 +326,16 @@ static struct dma_chan *fsl_edma3_xlate(struct of_phandle_args *dma_spec,
>                 if ((dma_spec->args[2] & FSL_EDMA_ODD_CH) && !(i & 0x1))
>                         continue;
>
> +               chan = dma_get_slave_channel(chan);
> +               if (!chan)
> +                       return NULL;
> +
>                 fsl_chan->srcid = dma_spec->args[0];
>                 fsl_chan->priority = dma_spec->args[1];
>                 fsl_chan->is_rxchan = dma_spec->args[2] & FSL_EDMA_RX;
>                 fsl_chan->is_remote = dma_spec->args[2] & FSL_EDMA_REMOTE;
>                 fsl_chan->is_multi_fifo = dma_spec->args[2] & FSL_EDMA_MULTI_FIFO;
>
> -               chan = dma_get_slave_channel(chan);
>                 chan->device->privatecnt++;
>                 return chan;
>         }
>
