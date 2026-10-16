Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A41412F585;
	Fri, 16 Oct 2026 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166327; cv=fail; b=Vy76OwDD3JXPjz9Xct8EuNNvyUmJvxY4pFW1DcCM5BHGgN9gc0GgjNMz47CKuaRqpnvJ6R0VJuMAvN2F5Ix2B9cLv61Cr69kPNvcHKt9DVNFKaMD4AHtf6E6cJISdMW9xgsgFlK33hi3yGzaAns6WAeoawPLjSUeWvQ7+dQ35Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166327; c=relaxed/simple;
	bh=v3GuMJj7M5rbYUMTjV9a0waKgDNLa+O73dHiTdJJhVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mSkO/eIZMQANlSMgkWLwB+aTEKjGBsykc28ZzwiABHFwYH6dwRWYPzG4KMZzLdK6fLG26fv7eNj63zb0sHrIugjqT7hin1eaZcrukVqW44/jKUsG1aX1RPyy85LGkQP6NTI+nTdvOBfrA3ey1Lxtpg22BKjjZQcJhBncVqymCGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vLEpqozC; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vLEpqozC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNXJG3ArrcVWlp/ek0XmgX+vaEXft5ZrDKPoBPdw78tcaJKlucQvk54Y8kZg6ddtA0sHAn8+acuWSPlEyYNWVtCnwH7vex4RpnnVtcA8WSrv1uWQYVPNsmIC+pJOaGZBdHQpI7zAn+Ms5DImsA5vOavnockXrYbqyp5OfuiqcAtIh66IWBBtmJ+85e4TOFD3nKZOLWF1LaqIALRDIKeVo+zcNgJ4c2p2+3+W6hv40WcdTK1+JgNqU4UWdnqxlGgu/GXCMerETiKPATRZE8Pzz9AXWDy8E851Ix0s9MUMvGe27POFTnioNHfDzH1l5Uv0GYhglswKZu+aRLDA1MvI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RB6zYpD5KbF5evU9szolJNfqPDiVsBja+oXw/1SsEgc=;
 b=XUid+hkR+bn0qNUQMgD4bgEdq6dGttmiguWfdcvNwiGQVJmBqFFLPEJu5P/ntc3xFaopaq8K6snUKgf5bhUJjBnexT9FUon2FLAoWQn5P6NXeJZ+QAKxlJCVT2W78oWeVWH7+wtM4Emo5p8hzx5SOgzZigjbMk0r7vmrlrVLliKZTLF9xAa///NwPRBezAVkjsdr6YUlBa2NKRTJw/X8xvxZrHGE3PCLaxpFdwbR65bZBuZHsQMSE91D+IRGOyTUa6w2I16/rsNfGO5UIYNDCUj2XdNCfbiw/Xh06VwlOZdHmWVk3WEvbwImSgzbOmc99EPl+PW7tpUC2KHE0blqFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RB6zYpD5KbF5evU9szolJNfqPDiVsBja+oXw/1SsEgc=;
 b=vLEpqozCtZnFCWns7KdFty7bNT4fLWg25v57TE2h9FGE/A/W94rYup1VO72NTzGWn1kA5LSQlLTFXmYRUYHsaknSBFo+UiJRgK5Bbt5ep2rFFg1993xyp5sYfwsvEY0ryWtEe9daeFrq59FUwGcB9lQ4f+AK2Cwa864Fcetlc1JVL8EQc+nQ2moQ3m1Yij8lSA/uATr2DCcodJLo52r1FMDx0YpI5t75xDNiTcJzmj0bInmomvrLSIXhlwjB3z7IaCvEyO8zdJCgMi40GKxj4wYK6jWJ8Pj+nJLoP+MC1uBSagusVn837v7lKL7rJEC0U5697J/FHA1nLQbBaW3GGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 15:58:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:58:41 +0000
Date: Fri, 16 Oct 2026 11:58:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: dave.jiang@intel.com, vkoul@kernel.org, ashok.raj@intel.com,
	fenghua.yu@intel.com, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Remove channel from list on
 registration failure
Message-ID: <atJJqx-Ef0jNePJd@lizhi-Precision-Tower-5810>
References: <20260709062303.4167624-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709062303.4167624-1-ruoyuw560@gmail.com>
X-ClientProxiedBy: DM6PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:5:333::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: db8e8f02-7c38-449c-b72e-08df2b9e596f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|18002099003|10067099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Xq6e3MEfAxGQkNVVJ3La/8JL3IphYVndZmRvrWZ/0zbGJ747rEUjgoZFBCzycg9ApzBLNbkUIZJ6GhIizNiuaM42Vb/FCzg+aeZxMZ33TvJ+zDVxcr0HytOkxEKUqs1hRpUKJ8etRevS70VkgeJnwc4pIRuqt+BmqY+JmvgWbt9aeOljx+SuDz0kXcxRXpSp0ETWbeUZeo+DQaf4pE2Q7yOVHBKcjnLuHn3nB5Y7F0IROrqHRp5Zo8BVM3bctqADOKWIOxKBo9DDBuZ8gBV8UsI4WSDnL+te3wJv+MamVyEDnPefIQ/T81ZgL7auVBMlq/bsEMOG/4Epd5+m8iaOaYEEeZ01owK7yH4dcEjXEDQ+pmOU90SW9PYq61p7rbUAL7AitI6m5LcKx0NL/IAskQn7DnwYM5szmNn8vfrhAMJ+Nx7ZoHjY8PvQSIzJuSr2Lm/vEbZ3r/cmZyMqhe+RIIHrwTwwB+G7CCswvqD2mIfJBeIidcKZMkH10qoFcaSAGD/jisNsWZ+8wWEiPQVA5dnAZvgWXc2r73zkW4vu+FY0i6iiYIt+GtqUMTZfnzgg3pJn409xXnIj71iS9IfSBkealmxkgeQDfpjCcKl4pCFQg8cJIjO+cONb3jpntUO/ntsq3Z/IkcsaDTfYaSNwSWvsmseDDtOxvnItmT8UnGE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(18002099003)(10067099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K+CHovG90+Y14KtDo4Dfp6dnN5HmEO2wHbQZl9PEm9dVruymkjqFEihnQ7fA?=
 =?us-ascii?Q?sZ/PG/Q0SxLnaSdp4ZI7G7nF1f6w6abTHAi42lPJk8q3LNcqlaMxTLe0kROq?=
 =?us-ascii?Q?KEbxvKKmNUlNEENHHP+3r8vuGVfxcetBLH+6PtQfyioufjhh+hxpRDPeSlTF?=
 =?us-ascii?Q?SMDDMpjdu3UcE594Q6YgQMG2dWgjwF+3dSb6/qS4HLrHSuVuqbP/r96jw5c1?=
 =?us-ascii?Q?GeWEeehfjeLo5wnIRQp06Z+rer9Sl5cc3IIsYb+am5VeZGtgi8et/gA2M1eS?=
 =?us-ascii?Q?TqvngxSlQYStcRw+9gyg+239no1YU1QVkzAFJVhzVOUDjr0scUdJ2ATmOVe2?=
 =?us-ascii?Q?iXnQAY9lqH5Ed5orfGx4aiGtxxwu1ri6RQEVBx9OVtZn3npG25Qr80lzSUKa?=
 =?us-ascii?Q?FW69zkX5RTlHopLw8MUDkV+u/47HMpJE/B69REkuKl0Doth9h5pkXRIzMtG2?=
 =?us-ascii?Q?668uXlLizLfaHKLZ0ykmUCldmpjpOP72KvbSMxU3/Vn10LfPyKA2EOnYW+M+?=
 =?us-ascii?Q?X+BKSPZtcUxfEYv+KK4jf8aSE8hUI1KEi5mYi+gMDDonEbdpuCsLIcGahLs0?=
 =?us-ascii?Q?+Rnb8UThOK1SZoiGEJ5HyGRHD/h0Kts11CWllFitOqGanT954Ha8wfnGy+8W?=
 =?us-ascii?Q?gYqkcnUkhzdQo3I2DwBn/axDYzau3AKNpm0i/4Qdwk1WUgsVu1n2p1bxS3Y7?=
 =?us-ascii?Q?aOsvtMGaexTKh/dV49agL15pEMnVmZNz7mChi+joHqUx436xSgEukJM3wN2U?=
 =?us-ascii?Q?2nnhbUoETV4M11ekEoclRDNVazXgG0VKd5tVpVEWq1K0PE2/eltHRVA/fQdu?=
 =?us-ascii?Q?lScUgj1MOcRbwDqX9gnNO6a/9rEqUFFpmYZLpAzkuVSTK37Fjr8pEwy5e6rI?=
 =?us-ascii?Q?wi5MdXv3zalki28GXd1f/exC60e+6ZY4R1wuDoX/dX6SK9z9T06lb+shIGAn?=
 =?us-ascii?Q?8JhPu4JXkPkbmw1G3gC+gTNl0jr7F5QAP5vptP6xOyxPqZ6LcakSgNdxgwRB?=
 =?us-ascii?Q?89OTEODpH1d1bhmUW2yDFo48tX+nR+XJdatgreuZ5r8ev7xar9VeCkMGAgd7?=
 =?us-ascii?Q?ltmV4zaF/xlMhZJ/0gmIm5RmxRfkKBApB4hEeF0vLpKvT4Ht885Glb3iWAlY?=
 =?us-ascii?Q?RYv/MnO2G05U84XXC/HjtVjaqiI0Uv/AUHo6dK6Hls1mLTDxxWv3dcUXS/89?=
 =?us-ascii?Q?yPEBeOJ4NbteKSI+JTHgmu8FsRrA6a2jcMVC5KNCRkXWOED0eZ/9COJkWj7r?=
 =?us-ascii?Q?1blmwWk4wVgNWsS2dzJgEszLOMp7flEtS6V+f+EB7fJZP/7BQBsYz+75nqHG?=
 =?us-ascii?Q?MQuUYxMfZQbB11PP7KS0Ef4tFR1b0FDA7QV9jQvLfuLp6oGpt2/fb8Nb/c55?=
 =?us-ascii?Q?oCsneHmHWmNYaWQPBovxkg+Q/9BolkiXfJAavOAtdHMIFt7BftgHPBnWfEvR?=
 =?us-ascii?Q?MLAnNKKlqFPadxOYWFPao/RLd+mPxw30X5Zk284LQ1FIcuc9lOwwjhV+2ORW?=
 =?us-ascii?Q?GCDDCgvkrGWEMbFdTH/2W/HVWZYwdz3bs8mgL/AGRyXecuBKsgXycD9gtUfD?=
 =?us-ascii?Q?DIQ5UBFY+/ic7UOKnvutjaN7SuCM31orJKJBJzVx+y9NbwRlSje6GmwpJcSt?=
 =?us-ascii?Q?aqIZq/QUfGdjwLViCBONvH/YKWavLwq6AWghYnx+FNYGdw9m0kmnNxL+nEmS?=
 =?us-ascii?Q?tiNyEEzp0u2OH9Wtf83ynRf9cSj1Xd6pnsFkbZgeISueFIcO1Wq3AM9jAK31?=
 =?us-ascii?Q?rm1tyFJgPJaXNd4bA1tE6aiyIPwWOGEHT4q8Q8gBUEMQC9+TEXa1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8e8f02-7c38-449c-b72e-08df2b9e596f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:58:41.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+aKWB2g53d31+12ZZibehkAViX7YZ5v+zBMdTajjkuhAB1NxyHbxGMvQZt+xQFzNxbt0Ht3p9BTzJ4yoAL0PLkDxdkSAfEtYuCV2ASKBJas94ClFi+5DHDv7jZqWWfX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688

On Thu, Jul 09, 2026 at 02:23:03PM +0800, Ruoyu Wang wrote:
> idxd_register_dma_channel() links the channel before registering it.
> If dma_async_device_channel_register() fails after that, the error path
> frees idxd_chan while chan->device_node remains on dma->channels.
>
> The DMA device can therefore retain a channel list entry that points into
> freed idxd_chan memory. Remove the channel from dma->channels before
> freeing idxd_chan on the registration failure path, matching the driver's
> normal unregister path.
>
> A static analysis checker reported the stale list entry, and manual
> source review confirmed the registration failure path.
>
> Fixes: 397862855619 ("dmaengine: idxd: fix dma device lifetime")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/idxd/dma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> index 9937b671f6376..f2c03f3cf1925 100644
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c
> @@ -289,6 +289,7 @@ static int idxd_register_dma_channel(struct idxd_wq *wq)
>
>  	rc = dma_async_device_channel_register(dma, chan, NULL);
>  	if (rc < 0) {
> +		list_del(&chan->device_node);
>  		kfree(idxd_chan);
>  		return rc;
>  	}
> --
> 2.51.0
>
