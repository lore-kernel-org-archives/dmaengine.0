Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EBF3264E0;
	Fri, 17 Jul 2026 05:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264625; cv=fail; b=gBEsFjCN4XjDZLZAuzU+kzFnv+4/UhRQ9L+psD0H8aTLWUFccWF7GMEuOWrmA6OqyiD1EXszihhG754wguOPC/s0GxfoxETwHbdO//7MgpTcx3D/DcBYZnlxJY0ZeE/pUOY8u9iV6L5Qh67x4dfEHIiTSRAo1KZ3tCpJxfv0uV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264625; c=relaxed/simple;
	bh=33o8slbGwr8xxzDhCzSqNKpKnSZjtWvPyMjCzqk2LEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ma03BMDCesu22MRqMzZ8yC0TH7c67ikQf6+ZOGgS7ARHtmZH/1sunKryMiFBEx4ACdLPziF9Z6EATBt6p+Xp4WA4obeNzgIh1o+Ms7HfX+FCVI7gjekB8uSAGNo1EzW5886JbNBPc3zKxNValmMagZLT4Hd7tNTqoodfKFAaP5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FUiPDG1/; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FUiPDG1/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtMiQIrgua842RFreIxBGtcYtwzkfhsfU1Rx7BydE2H7x9zLKrMDK5JNboOFJ/auvfSrxoejBQBod7TXZuO9SZnKjsriV6UR/VfVr80k+/oORdi6Mz0t0UNEoTxFdgWraSpoM67PpyBmzGC0AJFuf+PwAkl4R6akSqcKoNlt+DZATBM74YEwC0VoXmnu6rDfnpv/jTcil+KEHI9sSEQSVuDaowowjgHjHrQjLj3hBP3FqYyQAdPIZ+Uc0ih58BrIHq+M7gUjJDVSArVPHsxEgltd7F3NhgUd3240GaI91nyjGj2BHosmGQUtjPfMEQ/1lGoNnaEcJ7I3netGwJ+QfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ESfJ5Xu9zOE72lC8DPSx+daZi0sNyccbQgG5e4RwRs=;
 b=eecAmSAP6gA8iRenjyhaN45APgVZe+6IS0KeQhEq8iVPY9lxxA+jSqYFhNLjjU7HYpXHOM9T8/9Je/3zb49rQFU0/q3G+UptWpwc4rturdq319jvNROiJJZYTWnOEVn952XWRddYYlSIp9Ed4Cfa6AeO8q6bdabEEcAiIlCKd7WjL4YGOtdOcEti7CXRiHR8IY93yQUPn3kL9UYi0uYtrD9UU/ypv/eE9kyAve/i3X1DMEY6neBq5ak5IWxbdxDFeG+Wfhr2sOX1EuPyScBg5eyBAhJ6ejEZU5rsv6vlnIy6STNJ0BazILnahU1aiHa/D924o0C8xGOiPtBzQ3nygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ESfJ5Xu9zOE72lC8DPSx+daZi0sNyccbQgG5e4RwRs=;
 b=FUiPDG1/RCJd20WwsGmGx1BgnQjMrZOlKWKrcVzsq+ljA7J4VjmlIg9JSuAYb9RuB3X1gq6kJfadtxicQ0Ae0oCp34vqBE4b34oKi4KmQgiCrCQcjT+tKvw0XnZlymC8LeK5ZQb83sJiDg63RsqVfPPGmUAbdeQ35+NmzkhKUE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:26 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:26 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/14] dmaengine: dw-edma-pcie: Add chip flags to match data
Date: Fri, 17 Jul 2026 14:03:07 +0900
Message-ID: <20260717050308.2144108-14-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 5501fa50-ba9a-4d30-71a8-08dee3c0bc38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AiT8F5iadMSejWYlUkI3muwwYq8/xjXIeHhHO6pB32zj1Q0U6JIVvDHL9jY3Wtvzex6eTCf84plzhdAaYB5nd7CQvlcAUfhqArOq/iUvOtlreucGE2omoO55fgEsGLNGJIr0D3YTnqQ0VR+t08aY2iCUG/QR5eP6NvABJbYM4o5RB8A3V2vhZeI8RYftZ/DAxDZBFYPjcC5Ll0IaIwS58l1amcM4i6VdT7HbR+k1RgXX+FhnKu7x57jy8VeHbqaez10QYtEJhgwf6bzFSK6RpjAxi57G6X7Yt5NTjY4KLPrPB6UgZCOL7Dn8CRAYYin0GK4qJUwTv5krHja6FLDfiXkQpHAseMaBbniZ9/DbwLFoloD+nG73P18tyE621cmqOYRkILOwH7dmjf5BRcSW+ofrhkAFvyPwM0i/VEy0GskaK9xd3Ak8e++DRTfE0gZZRJZj5xX3/bfpT09ptIqxTHFswC4JeJOZ5wnfa0tiD/Vp7ddICvzTpUPO1Ofzo9tZRlFowPYvRT6vNv3JbAEezTvtXjSmtad2jkfeq7bx0+ue3apGjkRP6xprvujFJU+iVwsRXygs7ulDSohLVjfhwpDt+NLIBSRtAUDxW2ueclAXJOnWQOAHeoSp30mPFgehpfElWCce+mH7H/jAYmsvfYtd0k+2+mNuIlmcf8f+Fx8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EKJBtG7b12pVinkomSWFE8DGI7QRGKYPpsvc6P3PJcTI6/+g0E8xTAxSYG5z?=
 =?us-ascii?Q?moIy/zAFQARcSk7bvuXhvzTXGMa0NLKDPDG1RtoDRgtV5LeHZEAvKfIG5LZk?=
 =?us-ascii?Q?iiRN9iDzEofKOLvpWVndx3oTjQ3i1QO8jg8nuGmDKApjnjvEEOTWWzO5qLbu?=
 =?us-ascii?Q?1bW35POEGSvNOUVLb9REUWY79A7c6Ut7ZbL7Y4ZUpvcQTGvofW4Dp3wI/sXc?=
 =?us-ascii?Q?dA7QJ6YOEyUHXaqPQ1PvXb2Lo8tpzc7AqDed5oNXOWrgvD1J8OETI0zAiY2d?=
 =?us-ascii?Q?NcgwXcFpITwYfu5WLm7M1RnM38sa88kPJiavMQHcpKUv+FvqLAFLHi8rAUD5?=
 =?us-ascii?Q?eJclqjVaLIux27Sy5wT6vbwBZ37cQzpXBoAHpgugmdrMRIFvBEoYEvwxQYqU?=
 =?us-ascii?Q?/sq+SGHhLz03J8LJDn5v+mfHygbO9Lm6CUjmzrWI9fN1F3zjQRFz5WTVJn3F?=
 =?us-ascii?Q?H0d0UoAxZFJTOOPsX8/c8h8UWGfRlL5lUtS2H0NCeb+AbzsTQW+vTNKvKGsB?=
 =?us-ascii?Q?wa0nJVQtR+ZvF31+n0pqmRXrEsPKRRN/+G2jRCbuTnGPZtT0E6g1mUy+VS1O?=
 =?us-ascii?Q?kb73kGDRDTciBSiLGbm6ozaL01Bo3TMjg4vFApG1syZR3Cc1oTedaHvfAsXN?=
 =?us-ascii?Q?nchFLf/lbX6NfzDGNE7bGrR4mD6ewP26R11/l9sjfd8H8GHpoorhgF6caq/u?=
 =?us-ascii?Q?1l7lTIVNUVuQihdxx4ZomC3oJZPmpnGGTGpkPOOzk0HkU55tIzYeywhx34bL?=
 =?us-ascii?Q?G+rWNu3F7QqE4UofrcwXZvJDwgIAOWAZjAEaeSgiJ/QKJ4vZ8hJMGObgJ35f?=
 =?us-ascii?Q?Yv/b32e2jbJ+lu1TEyGugzFI/0zvvCUd+zu3D3bKuhjZEWxEfQjWTHDKCb+W?=
 =?us-ascii?Q?yqPTaIzxhZY7L1dD7EuqCoJXlYHqkJtmhxoSEFflASwFNU3O5k4VNI2OmS8W?=
 =?us-ascii?Q?PKo0IIN0G7maerrfXqOJLTu4l/28Ds4AuKFUJcjOCmbZ86q8/n5N90UktJ6+?=
 =?us-ascii?Q?q1uYKSnT2+gq4bZtw40Otm1ZHV5vwlBa0mnLcGkZd2vYI6EpXY5R7zD7s0nH?=
 =?us-ascii?Q?0HnH1oXx6xcWkXyU5B46zh+PnJWWh0G0EgVtoMW2EKTWFtDgi3aAuUpUwXGv?=
 =?us-ascii?Q?yp6hoY4EQr8i5uHXvK1NOA7cq96N7fNtQY+zKF/YJwZf9SRfsKIV2Euz7v/g?=
 =?us-ascii?Q?ptCaf3olEtQkI4MdchsegcdKUf8zS0zE0FjS1MzY4RcUCnxO+qAGe/YV6m0z?=
 =?us-ascii?Q?h8BTRE2q7wJtmBoLtaJowjVchG+3MlbK2ZK28ciTvdU8Jfw6M/1Z5pj8d26/?=
 =?us-ascii?Q?NAXaHdcCjL8z0c1R5QQoDBI8bw/CWFCWBCqQcrDzVDIsS+frPUocRRSyZQug?=
 =?us-ascii?Q?jb+alEtCB+FApvzbI8cpTPq6cqM8kV8E87/KXsHCChAzH5LzRI8ZvJAWk/cW?=
 =?us-ascii?Q?YvdMRMTSQ0IswNjozUtJLaUYXMAewsCyB3xPVjZCcsmcXgT8/jsonREzZOEi?=
 =?us-ascii?Q?Gqk5Uz0uH24nBD6Z0y2qtwLvQfnbcYtl1rEsgdfVAOXXQMHvy70nfczFN3H9?=
 =?us-ascii?Q?WPm64mYhcUz8LuX0pIPffsNE1sgVct3rdyk5+Wl2zyTDg0OqtNO9d09uXogI?=
 =?us-ascii?Q?9l3aQEqCMAEyM24CPIeSroOD7m76/JxIz7XhEeSZpRFrPq5gYSeb4Jh4/2b6?=
 =?us-ascii?Q?/Ebyy+qfhfOtrsycSNat9cuMTtjDsZxFU8iWP+GiNoLIrkM2WGRX8ksXFCyC?=
 =?us-ascii?Q?XIZ2hqDxL4DPEFkiGi8o6fEAfiDuP3Bvb0kTgFQBleHNkPmJgvwH?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5501fa50-ba9a-4d30-71a8-08dee3c0bc38
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:26.5770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXoSU/LN/XKXyubb97eEcq2HpA5cEGlnqsNgcRmflUjfI5FjZKtmJwTRYV06l0kjiM5c9XVbw3BAjbvKIGOfQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

Allow PCI ID match data to pass dw_edma_chip flags into dw_edma_probe().
This keeps per-device policy in the match data instead of open-coding it
in probe().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 8c4d1359a545..7f96e65ee274 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -88,6 +88,7 @@ struct dw_edma_pcie_match_data {
 	int (*parse_caps)(struct pci_dev *pdev,
 			  struct dw_edma_pcie_data *pdata);
 	unsigned long flags;
+	u32 chip_flags;
 };
 
 #define DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF	BIT(0)
@@ -471,6 +472,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	chip->dev = dev;
 
 	chip->mf = dma_data->mf;
+	chip->flags = match->chip_flags;
 	chip->nr_irqs = nr_irqs;
 	chip->ops = match->plat_ops;
 	chip->cfg_non_ll = dma_data->cfg_non_ll;
-- 
2.51.0

