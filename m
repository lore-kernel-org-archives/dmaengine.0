Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794602449;
	b=md3UuoCTZhBLpcH8Q6mdft0Vjr5wu2R2HgThlZrRQDX39Rge0bO28SQTA/1kDnhS6lOg
	 eDiDF3IPtopOI4oXEfnLx3CN6CRzlfRIzQrfiMTRb1xzypPSOmKCSLlhhmCa4+YaBo/9h
	 9nKuYH/VdwnszCua/xVclO6xqkrxIZfZtEEcazdZSNOq5tCCfxNjo885GBqz+JLgytQsa
	 P885xDrEAGV6kcSMc4EWGwRmucD2rxsc+pCQIiB8IA4S6lO5J0PaB7Z2nX/O3SiPP/Zbg
	 bCY/jzX3tJvmBUg6uCgL9gjwf0hh99rn9KYFIg0csUZ3G1MQ+VFcIKb9Prrx3cEp3ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602449;
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
	bh=3JPNnuy6Ijag32jBIm372/TrALn0UhZyUJmx6zqqObU=;
	b=W79GzhGNi/lYZG2nYWXPk2GCDUDJzUTNNhnJF4SVi3a+rGwxtc5jX/NNXN6VnjNIUFhd
	 WvdrHi+VHjTSVNHJFhKyX45J1fPWnNkrdcD4Yqrh9v7zePBT2aDVHwNyUr3Z6PFjxR5W0
	 Tl0JoFWni5usQwMFJFPPtHRT2S7xX235oaOuiX4oG1pLWiAwmkbQbKNk7wfYzHiAT/tyZ
	 GfayfLn/LUGmL+nf5CIIq3zs8cLesoqp81mknEKeGCzpc/VE10FjeqjlcutcF58ik+nZ8
	 b7pryIERkkoJgWZIc60U2VWn1qciIqvbm1abUeRzSQ6k4G2D0i58f/zkFoKe0VZWXrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L+7mbavI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.34
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A4606A889;
	Fri, 13 Nov 2026 20:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238A4606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L+7mbavI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcY2NKWYhv/6u61uZVCqh9i7ov6Mfpb9M2bjXdXDnhoXWMZJaF7S5LS/bMhrbJPVwHQojllb1MzKpQiMpT2FKgo6sW4Q64ctxgLOib9Iawc/fb+Orovhw9Nd8NsQjt7pXqHkGe3rCo+VSCVRbFkaeznvhfsyv2dP6sXqPWZzmxIQTOW3Bd5RDbGDSd0khZLN6HwlAZBYijOgE+MZCq4Z10yEUcXRK0b8LZrxqIsaHISiwboXWE5R2d86I7fivnryGCdJjEbZ419iuRNHJgla+QfwRzUF1i/4iW5NCYxxeYDfPc37ula/xYc4Cbt1iMzA/TJFM9xA3uxjTQn1pXPn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JPNnuy6Ijag32jBIm372/TrALn0UhZyUJmx6zqqObU=;
 b=aL9tbnMA1bkiH0Ixy7jSKKs0+FOy6KCTCQJzJAHS50PFU6hy2fy/MeeEjRzvMcGT+rKbxY1vvh18/qUIZX1Q49ptoDD6t/nUn0MiDkJ1TPczR7aZ+gE0tuvjf3maPbcmhwjmqIfWxHAZP+AjAcqMclrYeLwnFI5qR6gluoF0hZPQOqRnfHw+kgqdvDoAb9IdZdVJNiP+Hp5kB99YNvzSresUVh71q/68nL6vxgu4EWdn+/Jeyo7aNHlk9YDWelgm38kAvBw3vnwqaPWQ6cO4icUPTllLlbm82WoZ43Ygmc/AX/G4HVCWw4vpmj6MPPynzbcRS+Tbu/BTiFayX5uAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JPNnuy6Ijag32jBIm372/TrALn0UhZyUJmx6zqqObU=;
 b=L+7mbavIxi4dGi7oXUQpC0xAkds1lDLJAzLk3GsWh4Bh1ZlFuGNtbWS/eTJe+D0976TJYEWpvcGobrJj1XLMSG7kj6XjGJT9O/2itfZqXUrKYiRm9E1gNxDvdCM/kp1rhclh5sb9AtXQiq3I/CwuXFVZZE7lHWqpaFQxu0AkpX6s/DZbPO6bLC5sZExXCPnp6OSTcQZ8q8tU0bD25Bj4iMC+kvpdfaj7TsGcYzd03uf3e7O1R77dr8ie96HbirKaYbAYNUcO6IVKWVLgDCMZq1IMwTOpjmqUsZeM1peFoaoa/tVnVFRb2kdXZsdNuG9di1WToC8yQyKO/d5s8NPz+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:40:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:40:45 +0000
Date: Fri, 13 Nov 2026 15:40:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Nicolas Pitre <nico@marvell.com>, Dan Williams <djbw@kernel.org>,
	Saeed Bishara <saeed@marvell.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] dmaengine: mv_xor: drain IRQ tasklet before freeing
 channel memory
Message-ID: <avd1x5FoX6MsR3yH@lizhi-Precision-Tower-5810>
References: <20261018040724.534641-1-yaojiale02@163.com>
 <20261018040724.534641-6-yaojiale02@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018040724.534641-6-yaojiale02@163.com>
X-ClientProxiedBy: DM6PR01CA0014.prod.exchangelabs.com (2603:10b6:5:296::19)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: edfcb6b9-7a0b-4329-844f-08df41c664af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|23010399003|1800799024|18002099003|22082099003|56012099006|261021121427099003|11063799006|4143699003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261102123227099003|261009223027099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	QlomJYIFlKGtAHZBSI8iqZl/ZbLgvU6xNq/CXzKuMACYaChboDnNc+RnSdMQJxTZZsOybfFftW9dSfgniMw9hwpyRUuFxrANWogatSN+gc8FXGHQYzsVbxY3AqA0fKJ4+yCoRz7dtQOpuBYNLadJEg1YjGUHKstD1SeDmPxhzbDSv4rbJGSb+WEAYdRZJobv1uYKWa5CK3axg9BWYgr6eWNV/E/KhF79l/BDRVFmQ71T9UZvf9+1gOtFhAbq5Wdf+HdmGCskbjxApJuvZr7nI5wQoYmUzs9BsGP70mI3vNWGU//Hjlco/3T11qTlAQ+NPmccMQaOR4EFP3Hb94m3IRxbMRXfEE/ZUQn00Z5C6OEL4U0TY4jWH4Ypu7fbMHamaz9ccXM5WG6zyqr3UQfs/6qP5LQ7EykDlkCpfoHOtgtJ1T+TVPEzVPuz9CmdYa673tKv5qSE1Uxdo+4azezuAJJf+YbtY+f7tdcbi1E14D7fhPq3hkQ5WskKT8hOckY1gn4nOZcmJ4Qq2VOkRS0GKxYwF0NFUuMy0qMdgtCqd7JX4rLThtAq5fL8TONHRqzyfdsUiBzQHWFzEJaasBd9EtHMm2fe5fVKXK3J8+jX1XVMqz4qTO/eU2Pa3rca5XywQjgClmJpcCU4Y/gaNQf5AIjhvLQ6U/vs42oc97TX1EY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(261021121427099003)(11063799006)(4143699003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?77bMIyQxu+oRH534KFObHW+jVJBvRN8ZTBJ6WyyjZ2woWhi4xkytYeT+Mr7Y?=
 =?us-ascii?Q?Vwg53cKPizKvvLopiksm9jRBzHOzk/iIPNP9uwUVAUcQVd/Z7BkG6GtRGD+S?=
 =?us-ascii?Q?2k7b3c15Df3PL38ohJASwEqTeDQtD5Jg033zf8odebhB0ICbk8Krn1TOcWaL?=
 =?us-ascii?Q?EYJ/96O3v7y/u+IoHx9ksXr1OcvB4IjdXKPP/cvDqA5lu8olCowroQt+4hLL?=
 =?us-ascii?Q?6+LZiriAY9y0FliushBFJw1f8QkPZhxYRLjXKmmCuHqmUH/4/yZiGKPHJD9B?=
 =?us-ascii?Q?HtiROrmZQbbJDBNOO30LxXu54jTYnU+13Hks4fVjBsRE0dQ0VPysvtvND+7n?=
 =?us-ascii?Q?qniJvLD5w5m75aEUx7Y0hIFoP+9W4xQebDsoUwi4i621uFBZKpCQotE/oJqU?=
 =?us-ascii?Q?XvQ55c/Q2rIZvJEbtUzcpSkJ/5kfEHLyQMc5AG3NrjGx7jt/9+2F6Q/2Wj8Y?=
 =?us-ascii?Q?rgtssqu8u1UwCkNWYRR01Hpl5FPJXLfIB5aeM7KXs9WeqA3vXe1ocstBkEzM?=
 =?us-ascii?Q?Wopw0zAtwCsJmILfUBq1z3HN/UaL76NNMbkcM9TGfWBua/Yh31aNqBf3lUkS?=
 =?us-ascii?Q?GPdvTGEvPrwaFI9AVGW6B+CV5tkNxI10GDH3JtabCQUbHZzoUA7+gFG/0U10?=
 =?us-ascii?Q?IvR133orQpsOixoSmHfg0orePxi7P2ckMM6R4A614Pcuk7STBPLdhVhevsbu?=
 =?us-ascii?Q?19KQLHX/S4xrCH7uog7qtlwT+89u2f80+8aoebYURRrTaSb9xMrAkqhiJoMW?=
 =?us-ascii?Q?hFgaDSD6UOIXcxVPymyJMhHHlWmFJlExy8qQM8KVw2uL7MaseGr85FQfnj+9?=
 =?us-ascii?Q?JLVuS43Q6BMmJETzn/7mxuDnZcfTylqdWFZS2K8k4E7LKs4yhHcIrvUB9W0L?=
 =?us-ascii?Q?2ImD2eI5sQKNylz9y+ZBjlLoXuhp+HfrjeaiFDNIf9zwzdw2mlC7V2MTvCef?=
 =?us-ascii?Q?2wLsI4+dLFJX+fpi051gAurEVOatlAl7VWffNk7uiEaddagKFItwLecP6Aca?=
 =?us-ascii?Q?6iaPz7zmgxw4ebOUq81ShTuubwg4G8IJ81HHWomqX3dzWdTC5i/DxxY3aE/Y?=
 =?us-ascii?Q?uL5y+GgB74mV9dzfVRnoXjunewJetacuVyrefUSSmwwe7ECzn4GaLLkYgDsy?=
 =?us-ascii?Q?vJOMUOJVjCjF8QOzK7Q7ebNvTVQtn1/IwrzfX3adz2E+uI4IUwPRUDAAvOD0?=
 =?us-ascii?Q?irjmThSiBGsNUqyKzVQjl2mfwJuYiWExGWSCcsugbXe8+bhflCh9k7QniGrr?=
 =?us-ascii?Q?m/x4hNNcWxyRb+8GBeYln+fvVr8a9za09fyxrnlr94Ft7BlXN782g7qs6Ik2?=
 =?us-ascii?Q?8BwPx1LkErbGbMluVEmWe5BYsLqr135rNtpeseDYW2S4axp0/s3zr2CuOWbV?=
 =?us-ascii?Q?OGlpgsDAl9RUBVo/cej3qxztf2eZMRyQCzeyMVdclTOzAqlasetXIT5sOhUe?=
 =?us-ascii?Q?VpEc+Ga00C6z9XHzJRDKC2F5XxmBIRrFldmMbQsh2FwQ5I0w1JIshRWRMskw?=
 =?us-ascii?Q?EmEefQne5zMcDkrA1lJobIpgMop9TeJMefWvIPObOxmFZBa/KEC0YyGOOYfn?=
 =?us-ascii?Q?HJDGTEtgSXrHgGgkzgwOtjhHNVQg8D7CuBqsNgISS0/9pVLT0CrxjrpZ4Xwl?=
 =?us-ascii?Q?f4XdRGoIv86K0heGD9SAoga65Xc3dbthp/hQj+vLpe1e5ta0PpV8lztosSKd?=
 =?us-ascii?Q?HHiu329/r+V9xAhrdNICaAw58XF/Jk2vYBbNlqwT3cTLofQQxxk/zfSBVd8T?=
 =?us-ascii?Q?7AxtpSllcuW9Y32wfd+MwaHAKGE3Vfr9sDy2KcflWWuZLl8OAEJT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfcb6b9-7a0b-4329-844f-08df41c664af
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:40:45.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jsrmd0Xdmoz+hAkLJ4nXPdmfvWQY8FM8fLin5+OM5GWDBwBSWvQ6UZAldgqTBQYJBIxPRdWbTtRx4CCCGlvKxoMvVhdI4eW1N5OybsEnAs3EtLFfdbnougF33w4/F7HT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

On Sun, Oct 18, 2026 at 12:07:21PM +0800, Jiale Yao wrote:
> The XOR interrupt handler schedules irq_tasklet to clean channel
> descriptor lists. Both device removal and late channel setup failures
> can free the coherent descriptor pool while a previously queued tasklet
> still refers to it.
>
> Release the IRQ first so no new tasklet can be queued, kill the tasklet,
> and only then free the descriptor pool and DMA mappings.
>
> Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mv_xor.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b089..ec746cd16960 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -1013,6 +1013,9 @@ static int mv_xor_channel_remove(struct mv_xor_chan *mv_chan)
>
>  	dma_async_device_unregister(&mv_chan->dmadev);
>
> +	free_irq(mv_chan->irq, mv_chan);
> +	tasklet_kill(&mv_chan->irq_tasklet);
> +
>  	dma_free_wc(dev, MV_XOR_POOL_SIZE,
>  			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
>  	dma_unmap_single(dev, mv_chan->dummy_src_addr,
> @@ -1025,8 +1028,6 @@ static int mv_xor_channel_remove(struct mv_xor_chan *mv_chan)
>  		list_del(&chan->device_node);
>  	}
>
> -	free_irq(mv_chan->irq, mv_chan);
> -
>  	return 0;
>  }
>
> @@ -1162,6 +1163,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
>
>  err_free_irq:
>  	free_irq(mv_chan->irq, mv_chan);
> +	tasklet_kill(&mv_chan->irq_tasklet);
>  err_free_dma:
>  	dma_free_wc(&pdev->dev, MV_XOR_POOL_SIZE,
>  			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
> --
> 2.34.1
>
