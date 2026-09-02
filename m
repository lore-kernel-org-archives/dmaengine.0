Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7B44503EF;
	Wed,  2 Sep 2026 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363198; cv=fail; b=Xu29f9V77AuiqSU/V4kCP0/90mc+vvkdXRYOdAPA0MNYMbtDTszKe15fLcP8jokenxrOn4DnbnAtJtju9km/WYhoaWpp+IUrDNTr6aA6BNG/O1mjKwUDzBVGMBOj14LbZRSjNfcGL8UvhfE7yEU6nEzYb7Ks2QR/vfP6wtiW4UA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363198; c=relaxed/simple;
	bh=OEU7WwXWXq5roP6Y8olackHHcVeosltYMZr143AvkHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GQIRWZb7H5dVUpJllBup9K5DCz7iENf+yNEGuf14KRRX7tS28xN4GAMpCLNOMn07jFDfqEAplQf/Hq9OuD0twdnpJiSKzWMVMF4xaxc3hmIEhJ5IY1QUCn9TVr23EhFrKKyS38GpFwVsl1clhrkHXA73c78y5uSUi/86gErnHCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CE6FmqIH; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CE6FmqIH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiG9n//4A16UaIgGcDwsaaY38JxOoPr4nZaeMLYOXOPiix4EQ8bLWMccwTBigYth0cQxPCq8k50pQ3KNTfjZAimGTyLq/I4Oz1OLF/jJCFflRIfJcCpQs+GHKERSpY0fl7WOOPCKozBEipCsa43gbk2bo5hUFVbfXBcHx5U6n1L/1bvkcBmd/aC2sqCvuJxsYp8BT4YzUF0Ywid5AKqa2WT+ecUGwNiDKliI0SDgU2dr0GKVsB/kx+eX6v9s2LSNqjU3IaGZyfGQ98il5Nczif8/9JaTVE/WUxlFt/FCuE7t6B9euqD7nBI9FCMzxNlmv4kohicUiJUfmtwImJeVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruOSxFkcBIw1AnLR3FTacGh4dnwueQgYJRzuD+JV6pI=;
 b=Jeey6+41+CSrU3j/srbS6V2VEzUEiDmn4E9oDhikVoaaW1omm0rg94fxGhxVRJbjrVKeaONrqpRQdCcNQjbDk1RnChKHtFRM/S66+Sx4ZZEg5DFekuFBfyKsZdewcA/1mlxrk4LZ/jQHKxZQ6zHmlzZrxCg4MC+qnXfZU7W64+MMie2jy448mo12kxAK2ZtJSLx4amjQMWIe+dxMZN3Jk37NDYaxd2xZY43El1DFgEglj0CYeyvXz9GSlMKAerx97t86cPIS66pEtHp2rBC4w4nSDr/le4RTytr2lVBTV4AJCFIqce6VN5d8bjw70JtZk2zdyYjtHp2C/9vpk75d2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruOSxFkcBIw1AnLR3FTacGh4dnwueQgYJRzuD+JV6pI=;
 b=CE6FmqIHykDenmgkpBF5zyBACRs0CDXypI9r5aeskwDlpKBJB9H7B4JpoftlIVFq6A//l9HavJ2AAsqkesrnCfXA9tFS9aTXCmaVgkj0xi+5kIfc97C7MwDMYruNBPm6qamXgczCUAnbQH3To42V60hBOv8khhengsOQ5ibOoTVtGoyd5e/JR4CAmP1CAHJObLPxWJ85o2QkPFi/RuZmX9rQfSMR+mf/VLPhR8W+HfzY/yMlAvwtGAC4nnGbWk0Wss3tIFliuMy2SHjTUvUELUwrhKen4vXXcQvJQocnH30Tjm9vRS7jhzb03Agsitl5n59eUo6AUhKjvt2p3lXHlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 15:33:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:33:13 +0000
Date: Wed, 2 Sep 2026 11:33:04 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/34] dmaengine: apple-admac: use dmaengine BH
 callback
Message-ID: <aphBsOllNr9b0aBB@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <cc5172b8779e4cd15f2c1c7fa93174aaf09dbffd.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc5172b8779e4cd15f2c1c7fa93174aaf09dbffd.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH8P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e953e18-1890-444a-4e6b-08df0907804d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|19092799006|366016|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sbd5S6Wa/eWs82sjPB6ya6NvzZ6VjrHcoenuBRYjJ5FqyzT2kGwZoUU8wv3+/z9ksxn7b7bfzz1zt0LPAnBmGZQ3OJNTTitsMzMLkgyUt/3g+CxFYHZCY68Sq4oZfods8c1t1QqqWHY1pmvLnhI6UIYqWETMUReDpQxRIrPflL9KacfjuKv7Zz2L2ZN7x21eF7VByUoUN/aCnmsC6a8VYfR84hoEIiUdHOMk1heTVMbcaY10478PfqTwVYuTbVQ1Mt4416g+Mhl/AKgu8PoJC57A5LFiBGX06ZD2IQeBYVsQIDDcOsFRnt5/ZvVqw5AN35AXyYIZwSDYQT2kWx1CLMgjC7EPFYVW4yN2MLy+e01t04pzOo77GXHph3U0nUzupnTZDG8Z7VWGmlZt1g8g7QKMrJg/R0HP2j2IACGEoBumCmk47GjWPuOz9OEDQRZpZl+/yOky0ZmK8J8XVJDP6O6hkieskeZh3Zaz1hY3USqwDs+Jy/FlXdEZoonL9z0HIfiY3LxkMNu5yopVnlVhtvCMaX/iwq4JRjw7kpEttRngEyENSLkVjQxDeqg42lkt9zs9//48v085a7VStQx1vFH44NlwW9mkm21uM0TWeYC5jt+j/cQk7K58QCoiDjUo6eDgPUIn9AHzhVY/0m7xsuXs+Vyw4YLmeiSb9hndtz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(19092799006)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wy/Ww4sJ93fL2b9Krq5PUzPOC5rg53YFmt2AsQhLw8l8YQ3+8p8VpR6wpkIg?=
 =?us-ascii?Q?bNFCQsZva85O3Ox86R1HX+LDCxSA4FRThF9g/CKwdD5H3uZb+GcNNyeCiBvZ?=
 =?us-ascii?Q?BCaJzwN4wsroWFVindY96B1L626bw9VWOdXB86gWRMB3zAyyTthS0XiB6IS4?=
 =?us-ascii?Q?xNv5kQ+sCCKaCHkHf8IgS3cnUplf2WaG02tUpgNftKIjBYM5Ks32SYxpK4ox?=
 =?us-ascii?Q?55AVS/STEn80Tw/hDALFhN6dBW6HWh6WgZuJ0ilEkdM4QRcno2a4f4cg038C?=
 =?us-ascii?Q?86gU7BqtOZfXvwh9JRIZ/GKVvzp9Ook80CoRXyp1Oe/EU6mSU9fSFhW+HvVR?=
 =?us-ascii?Q?aBxlEHPbTxC1ZtVuNUncfL+nElmIXkBwTgrwLLsG5pjFnVSGjz/z6obkmYqQ?=
 =?us-ascii?Q?DSAu1/BfqE3ZXM8UNl71o8dXE+8D7if0rkydvsLKwc929ET/Z7yH97XH4NFc?=
 =?us-ascii?Q?/9aYDOuTSRi+43Dzm8UPUafOzmL/pPZJZqXXTFncC6MMxatw2fHVTpvQg4dJ?=
 =?us-ascii?Q?2sgV6dixRWFVwO6Mj4ZifFblsx/HG4b4kbeW2wie6QcJiMNHfXayBRDuxa4z?=
 =?us-ascii?Q?Z2ENbqmhBN/OZ60UR20zwqM+7OEqpd0PrApgTyL6kAYSpd182pnllVuiKyAR?=
 =?us-ascii?Q?TTsJ8D6uJrLGsKg2OeMCxAAjBSzT+sKtiThL8XT7GLOnGgdpTIEDibQt53mc?=
 =?us-ascii?Q?6E8b/gc0y+RLD2RSOIxqgLOriMh9NYoB0BT8Sk4PwpvjucL0JcjPsduy/9xO?=
 =?us-ascii?Q?J9UzV5o+Fyf+DreMx/XpglzRd/ToN1JTvDS5SUO4gtuM+Zw50oUqeiBzCIlt?=
 =?us-ascii?Q?UsATgAFS318pDM8CFJ4AXJmwztpATlwPFiW4RhfNxmc25pN50SEw4mmTf+M2?=
 =?us-ascii?Q?L8KB6r1Jr7V+R8PzZHit8q4YvFWG9cnBmOQTtSZmA2975LTUre0PYbaRBCNL?=
 =?us-ascii?Q?PwRwi+IQBJd2s2I7fVvLrvlIawuGHntGYjdPK7cj0Tet0yuPMcXfljQu0VQd?=
 =?us-ascii?Q?1pTFx0ikCrjf4E8LUBvcC1ZceJbzCSsrqToIPSpw9OrLZFpwvqqyICSD3zk9?=
 =?us-ascii?Q?lhkUJZws9oomFBqx+Y2MP9zReFY1stl6TyQR3Q41yuVdL/eaCot3pfT7W3n8?=
 =?us-ascii?Q?fXSXz88pxIoHvoGpAdnW289p1xv4VO2xNtx0/xT8K4AlBDQU3Edl/HEbQvKG?=
 =?us-ascii?Q?4say3rtxIOqQl+pMe5gZV6DYDEaIztH+W7z6c3sepPcJpm2UE2pQK4Za4eWg?=
 =?us-ascii?Q?t/BCO83PV56VBGCEKQFMq7qT9h9SGanuuRWwWsHW7e+fYatmOAExZTPzHgCu?=
 =?us-ascii?Q?l8aBeWRZMdrDCjswwrKxFI7cvBm1XE10/Iq54CezeuOCXgc/vTH8e2OeuPnG?=
 =?us-ascii?Q?YVhaZxxHYM9Wx8wMFCcWSMMrNp9CgOg61iAq3ixHomf+zbmy2BaffPKeRMDR?=
 =?us-ascii?Q?RwDpoIkCGnvIRbz6JS+NbwYyq3Eei8qcv9mxnXJ2wTs3br2pjvOvwQ7yNAqI?=
 =?us-ascii?Q?3FPnvs1HbzTVf5SlwFYuD+f6K650mqROl8iASHIBRyAbgeLWkei31Jn9KQPH?=
 =?us-ascii?Q?zHR4sNqDbppnBvOHKDjCiinZieF/mSvJfWDqWksttr9eLHWYz4fVQbiVgUcn?=
 =?us-ascii?Q?LA0qBuwkrsTlZvhNSH9DaDTSyEjYQIQdziZnHnHwjJIlw3KNYokcxp3Za6EU?=
 =?us-ascii?Q?Ll1UdhmGod6IwNtlCiiIeZgH/iJxNgBNVe/3Lwqj0rMbCMREwMkMkL66p545?=
 =?us-ascii?Q?aMHUR6DSgw+rhW4t0O9eHlPune9sZGQYCRCtvCIvn0c49xbqQ49Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e953e18-1890-444a-4e6b-08df0907804d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:33:13.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyJMNKvjtv4GP1rxsST55XFjQltU1/+NkvwhCioAqe69w6fmnKyDsz6v40zHBFPjwGcRFIAeY6d7RaveE7FUsHIhXYabWaCQoi/15jVd94nizFup1PZsPhI8xTpUjaMx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

On Mon, Aug 10, 2026 at 11:09:04AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/dma/apple-admac.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a481..c5d4fb96d3c4 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -89,7 +89,6 @@ struct admac_chan {
>  	unsigned int no;
>  	struct admac_data *host;
>  	struct dma_chan chan;
> -	struct tasklet_struct tasklet;
>
>  	u32 carveout;
>
> @@ -521,10 +520,7 @@ static int admac_terminate_all(struct dma_chan *chan)
>  		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
>  		adchan->current_tx = NULL;
>  	}
> -	/*
> -	 * Descriptors can only be freed after the tasklet
> -	 * has been killed (in admac_synchronize).
> -	 */
> +	/* Descriptors are released once the BH is flushed in admac_synchronize */
>  	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
>  	list_splice_tail_init(&adchan->issued, &adchan->to_free);
>  	spin_unlock_irqrestore(&adchan->lock, flags);
> @@ -543,7 +539,7 @@ static void admac_synchronize(struct dma_chan *chan)
>  	list_splice_tail_init(&adchan->to_free, &head);
>  	spin_unlock_irqrestore(&adchan->lock, flags);
>
> -	tasklet_kill(&adchan->tasklet);
> +	dmaengine_kill_bh(&adchan->chan);
>
>  	list_for_each_entry_safe(adtx, _adtx, &head, node) {
>  		list_del(&adtx->node);
> @@ -662,7 +658,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
>  		tx->reclaimed_pos %= 2 * tx->buf_len;
>
>  		admac_cyclic_write_desc(ad, channo, tx);
> -		tasklet_schedule(&adchan->tasklet);
> +		dmaengine_schedule_bh(&adchan->chan);
>  	}
>  	spin_unlock_irqrestore(&adchan->lock, flags);
>  }
> @@ -712,9 +708,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
>  	return IRQ_HANDLED;
>  }
>
> -static void admac_chan_tasklet(struct tasklet_struct *t)
> +static void admac_chan_bh(struct dma_chan *chan)
>  {
> -	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
> +	struct admac_chan *adchan = to_admac_chan(chan);
>  	struct admac_tx *adtx;
>  	struct dmaengine_desc_callback cb;
>  	struct dmaengine_result tx_result;
> @@ -886,7 +882,7 @@ static int admac_probe(struct platform_device *pdev)
>  		INIT_LIST_HEAD(&adchan->issued);
>  		INIT_LIST_HEAD(&adchan->to_free);
>  		list_add_tail(&adchan->chan.device_node, &dma->channels);
> -		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
> +		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
>  	}
>
>  	err = reset_control_reset(ad->rstc);
> --
> 2.43.0
>
