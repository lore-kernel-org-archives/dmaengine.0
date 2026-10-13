Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C695345FFA7;
	Tue, 13 Oct 2026 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903471; cv=fail; b=i77exbz6Xd5lUQMqQgDCv3tIHoyx0vvqr+jaLqW5MNUSvrY3oZ+1kUsxgQKdVfH7/qNRz9jstGkYwOeyZhJ1JbqRHV/TI59lwXYmrlzxJexWyNSbB3H8S5lMn9mWHN3ZKvwITmf7Uw5eNvbE8/aMq1NLQ/5NmcVVL7A0fTom0CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903471; c=relaxed/simple;
	bh=ff8bRzivavl+zQzIUs/EjnQv9rlH6HLrhFBxBo/q1yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lis89mBkFp6xyZIGSqEkob/DSrFF8Q34XAzgExWw/szt4klv2luIACOI6tAmEE8H5o0Qb+g42dBZsaHw6krCyiuwbYbBu6SZEEeXpEnjstecGa2MEfO4Ye3FqpNyESeZdTov4jbksafPRxqiMkVoQnBYZsR9eD38NpH2jkcMDsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HLVDmwxL; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HLVDmwxL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzlAiaLEiDIbWnpWgIHtE5bLI0Ss8m5w7mfEn5a4zyLYKVyCiY+n2jTpJnTRsKr9VAVBiTFbeX+L/+art0J5cuqjrL6L2uwqnQ7y0tW579Q3nSCQqy41RDH7hhnrdAQRYt+xvrgykQ4ASHynWjZmyFVKhNiKCRB7NgOrSTxt4BCY58JZK8aj+S62KzR5c4dzr/mOGziyU0d0/d93EE3x5FsKUrH7dXw7IALbfSigGXvJkO/iSjsvdcCa2uvzkwI6oBC0G52TiwN/rhSuvhcJCD/vbCjB6r+44dCTFsW4bh1oBRq0H9F6y5xQ7U9c08AEybJQV9cHPqxNqeOoYiXSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIAj4XCPCYo6zqmKUbSnkn97071yBniV27V1kg4aFic=;
 b=NJKuPwiy34kWzQh6rGJ2IoO9MXt8BOdQLbmBQn9Q4IH4S9zoy69xlgrk9gnhJ0MCxRnM+qK585akneSQF+uYWaDrvzlPmwSrKmlQwBEpf1S9HW2hW4TDUIL+4NiuAu1Ww3Ch+YT4fM9gQCslj891VKeznhUMidWjy9u19eCpR54C3L9DW0Rz9cOhFSTub+tA7bw4rNuYp4iZmovUatzbwLRXOVXC0RKtzK+AjOw/9vuuYJDeU2pbP88G3pMUFsIG/Wiif6GVRkojvB09cULz9wJXbH34BZtBx/fftVZ+plYR9bdHlFmDJ/Cj8c306aavRgytteCbSzm8tAqVUbfnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIAj4XCPCYo6zqmKUbSnkn97071yBniV27V1kg4aFic=;
 b=HLVDmwxL/lHMbLA2aCbaEadF9ToDfjFYk6Snh5ch+apKQyRxGzAGCVpEJsjWW+D2xQA2iQAon/0RYfSUbQZFVWt4X5pyUQIg7w6Y6FsMevp3g8+q2Pdkv8/MuLfB+xNF1m8kHtt6PX/hTQxzreIXlKvwH7mRjGMWriEphB/XrjSwJU9dG9SDJwQwN4TBgXJBcyPZ0o4Rst9scPux5dPrnx7GghMcEJsQvHsMjcp8+TuUUuX4iF26PL1OTZ3aiOSySCWiOvCUqglIZFHHQy7Rj1ugK3TreQHkU7Dd/ZakXPpOW93kTxahxkA+VddQkDg9zna/S6gOZ3lyknsuuRKYdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11852.eurprd04.prod.outlook.com (2603:10a6:150:2dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 14:57:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:57:44 +0000
Date: Tue, 13 Oct 2026 09:57:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Steve Wahl <steve.wahl@hpe.com>,
	Bogdan Codres <bogdan.codres@windriver.com>
Subject: Re: [PATCH 2/6] dmaengine: idxd: fix duplicate memory frees on
 initialization error path
Message-ID: <as5G2DmXXSBsjP5c@SMW015318>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-2-30a35a445077@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-wt-idxd-fixes-v1-2-30a35a445077@intel.com>
X-ClientProxiedBy: PH8PR15CA0024.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11852:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c0239f-89e1-42a5-8a63-08df293a561d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|6133799003|10067099003|18002099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	nfRLBqSbjCcgy4AiHTTcLyGdIWuOVE13pekGeoAuslh6b6Tm0I8+dGlF4hi/dbGaXRMgS772KqR78VlN8wbRS7V/QmVdjGOf5gvrCg76mICFnIR3u2zfmdIFfKjmcCK1Y49nO2EfHRlEe27JytxK+eofnrcz/Fp4ssjMiBQhnhkxseRFi/tSsQEv8unHGX8JrtU+ZCCp29hSVsjtptjQL4TY955zrjGyOUverFBKDjC8/5L86pURSyKSCyh8vtOnGNSSCOPwiiOnRrm5887LBVc738Hk86WzYtIZaLZrjBYv4OhyF1oBWv/afz5rSWRB2ildKxnqB4g7yk8gWQMUmhItwjPNy2gRGKp8UpV+rtMxDpwA6ehDyw2Q++ykif8RP6kkagOHID0+izFNw3q4cRodJjPNSEw1wuopuQ8t+otRmkzCKrkspg1KrV0xJmzQUyc/dXKSg6V1xDfgl+yMAOcuqek6yYd2dFGcRnIujCCCXcQxoK66RXMtnNDdkcza6oPojXRbK+DgeIZXOtZjBkI75uwUUurzr6Hqo+iAM/8N/8xuB2YjpqsINwjH+8egvxZ2ne5IolpGcAQfrYGrlrwgUXPd+hBWv/5xr2eXgVPPV7+Fwky2wrDzQqyPplNH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4giwe9dyCnG2ccvLcx72FdL8GcsjpDJhDflIzu81QqQxMTwQazwN/Km7Unj0?=
 =?us-ascii?Q?lR4QtHXoNIhFEpNfR2y8Swf1HIRvkRjq/x/n5OZJhxvV55YMOgwBogOqfMEu?=
 =?us-ascii?Q?XRCmVS6wwyio81sucxlCzp4NrXXixXv/kiE/d8GT6VOz8kRwdy7r1+rZIwlf?=
 =?us-ascii?Q?Vft99IL8iD+Bdv+jPuhph+pyJwbsNPVayDSVZvw7zgHuFLuXMO+QbllZi/Xv?=
 =?us-ascii?Q?JdlFvY9WKJ9A0P6ZL1bhsQig4ihq1ynL4a7K0kAaXMqqnWyN5kdFTcxKYmd2?=
 =?us-ascii?Q?2IpZ2moD8wpyl7nnfM7NUKT4LJbpcSqCuGX1lHQLkASDNZ5vt8IyH+44LgYE?=
 =?us-ascii?Q?o6G4SSny6CJdxQ+Q5nxaA4P26/M5Wbn4Z5DuIzxwh+DSuvGRIM79e7hnjeUq?=
 =?us-ascii?Q?1cpDw11TCLgC/xCpLu7jIUejI7Lxvp+9+sqIWkU/jE0qxIsrpKMbPewEu8Dv?=
 =?us-ascii?Q?KmcGAiOQHSWW5Zkr8j7kR6xbLYLLRUhEp+GKP3vdzfTqn2hcAdTrS1CRpjp0?=
 =?us-ascii?Q?2Wg776gQy3SySd3OF66plW9HYsEkcbjDoUnMy9vk90csphGIU5KuYjdlQ60o?=
 =?us-ascii?Q?jGLIzzSrtK6FGG/5WVLYBq43HzcNPD5BmtN+RVCQRgOWjEOsp2FwZB/Ffqdz?=
 =?us-ascii?Q?oY91N4UNgVC7k+d2I+veUjWI072SWpzGGZkd2WSu2vyVtoofAc5fPSEYpLbq?=
 =?us-ascii?Q?A0fKTGLl1Vm5NwAXsdCwV3tIQVCjNfevAB34G/9qH7xeGCSp8eYwtFGkdcbH?=
 =?us-ascii?Q?IJItSCtNHjNSvQ0NERAbd9C0I9t7F3k+j4XRilbhSxNhqhC679QMBJ0gxo8o?=
 =?us-ascii?Q?6tV6Vhka7U7Fnee3SzB7Ar6nPxfnXC+i7sYRsjRQvhpQDtddjOZh+/jlrcZg?=
 =?us-ascii?Q?Hq4WRn3iSR4D96506fYd7zfMvCPQj76MwoZ5YmIXOq/Uu6MwsseYF1TDfroL?=
 =?us-ascii?Q?4WDp6FKTh3ETaR9UGA35xvX4xE2Jqnh5qcbX94pNjwSZ1clbrv52Od/MDA1Z?=
 =?us-ascii?Q?+xceStQc33uKEI2ivE46bmWMJFGI8Hkq4+Yf/+OQLsm2GhEQfeVWa4RdQ3H8?=
 =?us-ascii?Q?34v2tXNsN8fB3nzUfCn7bfB8Vx0W5w64TR0a4XwthLQuMwSTtSCG73xSLuAe?=
 =?us-ascii?Q?qKE0MVCefmT/A+lFUjmgfTJ+v/lG9k/eI2/fJiRTWfWiMewIauGAl2kH+j6h?=
 =?us-ascii?Q?LE41jOc1m65ZBpy0HFKeA4eqlyOCFlRTTZIuP4KGgutdCLQy7T2+7BqWVk08?=
 =?us-ascii?Q?BGq1BLF5fUjZhxY4a9FSZqUNXgPyYbMSxqOZ/Q/vXG/PLItRrRSe8XHX2D9n?=
 =?us-ascii?Q?1tTWarX/f/uaTtbYjjNskIZvboTlfWcg7Qun9fFNiTL62nFndCk8HAl8NZ3O?=
 =?us-ascii?Q?GuJCr2PcDlxGO8FFMpnMBEK1gj8HNNxKHBVJAtF4bleQgk7+hhKLt//oOyns?=
 =?us-ascii?Q?8aDn4K8zIJ98NZDBlVuzYb88+LwO0yp0m+hievBB5MURxpAuwuqL2z5n8d2p?=
 =?us-ascii?Q?LBmdUZv48a6dIDB2WzugAZ3xKeGkyprB6fmmfGxRFNhY6NGN0yPXsPF5pHCX?=
 =?us-ascii?Q?+hUajHXvnMp1FOPUY4BrH6/O3/EIAN1HS6yQ+pbXTx1ocP8o4XeTP3cNlD2U?=
 =?us-ascii?Q?kuUBJSAU1ZaM5BRx5Ku9lvZe3vdzeNEb9A7+OJeQthFt5PxKuAFL4sOAbe6A?=
 =?us-ascii?Q?a20T14ZEbNsoj2Isw1Ct+qxC52kt+aLnwUmW8vNZ0ynitSbowZWxVKJCV6oE?=
 =?us-ascii?Q?yvJr4W/XIRO33bLHO52CZBfmHgsqxT/PYbK1IohndHTG/EZcixgT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c0239f-89e1-42a5-8a63-08df293a561d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:57:44.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkFNm5RwdBovWx6I27itWJZcmxkvOI/Uzq3zXnxCZCQULM/3McUbZzABTFvecqJ/3xjoQSNgeei/m8IQzDKQw08t4v2UWnMIdCsxVnBvTpPqxYF9WxzPkDZrgjhbEe70
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11852

On Mon, Oct 12, 2026 at 02:38:05PM -0700, Vinicius Costa Gomes wrote:
> From: Steve Wahl <steve.wahl@hpe.com>
>
> Error paths within idxd_pci_probe_alloc and related functions end

idxd_pci_probe_alloc(), check other commit message.

Frank

> attempting to free memory already freed from idxd_conf_device_release
> via put_device.
>
> This was encountered running in a kexec'd kdump kernel with reduced
> resources, causing the "Device is HALTED!" branch in
> idxd_device_init_reset to be taken.
>
> [   18.628791] idxd 0000:00:01.0: Device is HALTED!
> [   18.631447] idxd 0000:00:01.0: Intel(R) IDXD DMA Engine init failed
> [   18.631450] ------------[ cut here ]------------
> [   18.631451] ida_free called for id=0 which is not allocated.
> [   18.631462] WARNING: CPU: 0 PID: 11 at lib/idr.c:525 ida_free+0xd3/0x130
> [   18.631474] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.12.0-1-rt-amd64 #1
> [   18.631477] Hardware name: Dell Inc. PowerEdge XR8720t/0J91KV, BIOS 1.1.3 02/03/2026
> [   18.631478] Workqueue: events work_for_cpu_fn
> [   18.631480] RIP: 0010:ida_free+0xd3/0x130
> [   18.631492] Call Trace:
> [   18.631494]  <TASK>
> [   18.631495]  idxd_pci_probe+0x1b0/0x1860 [idxd]
> [   18.631506]  local_pci_probe+0x43/0xa0
> [   18.631508]  work_for_cpu_fn+0x13/0x20
> [   18.631510]  process_one_work+0x179/0x390
> [   18.631512]  worker_thread+0x237/0x340
> [   18.631517]  kthread+0xc6/0x100
> [   18.631520]  ret_from_fork+0x2d/0x50
> [   18.631524]  ret_from_fork_asm+0x1a/0x30
> [   18.631526]  </TASK>
>
> In idxd_free and idxd_alloc, do not attempt to free allocations that
> will already have been freed.
>
> Fixes: 90022b3a6981 ("dmaengine: idxd: fix memory leak in error handling path of idxd_pci_probe")
> Fixes: 46a5cca76c76 ("dmaengine: idxd: fix memory leak in error handling path of idxd_alloc")
> Reported-by: Bogdan Codres <bogdan.codres@windriver.com>
> Link: https://lore.kernel.org/all/akLBL7b2h73pK0AC@ilogsc-qemu.local/
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> ---
>  drivers/dma/idxd/init.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index 4b827a329756..4adb3f3bcd01 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -581,9 +581,6 @@ static void idxd_free(struct idxd_device *idxd)
>  		return;
>
>  	put_device(idxd_confdev(idxd));
> -	bitmap_free(idxd->opcap_bmap);
> -	ida_free(&idxd_ida, idxd->id);
> -	kfree(idxd);
>  }
>
>  static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_data *data)
> @@ -623,8 +620,13 @@ static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_d
>  	return idxd;
>
>  err_name:
> +	/*
> +	 * once device_initialize(conf_dev) is called,
> +	 * put_device(conf_dev) will end up calling
> +	 * idxd_conf_device_release() which will free the rest.
> +	 */
>  	put_device(conf_dev);
> -	bitmap_free(idxd->opcap_bmap);
> +	return NULL;
>  err_opcap:
>  	ida_free(&idxd_ida, idxd->id);
>  err_ida:
>
> --
> 2.56.0
>
