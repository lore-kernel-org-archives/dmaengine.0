Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F102F8EA5;
	Fri, 17 Jul 2026 05:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264603; cv=fail; b=XTlvtgf8WKkiNqjDPhvawoeNN2ahAjCjbbxr+q28eX7Z1Bpm3UaFCgo3vxdtVMbl9h9Nr06BMHFUkL2+H6VorMMTKq0J0LpIYfIB5bVeJCyLwQRKLZJtB9jgiCdneJk/7THiierd8vfnWaQIVLldWAOtXp2TI97lKbvOaWyUo+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264603; c=relaxed/simple;
	bh=XNhEaVO0+6SFnN/eJIBqTO18QfLpef+Kap73lCp1QlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ka/o4qILuSw2Kk/8qN8LboXCbUpGdnpYtu33YTOklVVyYa8Lz4ITSbr21Mhid1BQij5dxnjgshCBQh+zPtXAAvKRHh1OXWCDEcA1OhYgE/VocVsaqGC9fNLjpb4Hbse4oIXRAdX13I+9CQZYp1K6F69m8mCMSyWhNLP1zGNmdcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=CuI/tuKI; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="CuI/tuKI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMD9bYakOFiCn151PBzB4Xk4cl1Gs3lE5ObKVTH2Ki9IB6fRapTPqhb21FYwhqS4EMCjoKZ/hGq30ymeGsZ5/PodgtswqJ4P1soflQhcdjDw/yGkuktTHzmgKFmzT58nzXMhGZ8OQYp9u6JryjIGsD3HdxyGEiqUn4TUVdxRLtmEcOa8kWkwB9g6PdigQxmW4H9Gw3EWYK12BUbKkB7RwXCWFqCd69pOXZt/A3H2P/h8p4ODfwLBPjXj9NKmiEZOeUO1ielUqwCMAeP/YFddeJh1Y3quDppcKF0qy4jrvALEDy7RHsjUWMa8JYBV7BGEwzGz8oHji7BrBxyLbY7Mfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qvhJY5i/x+yGhWdY1qD1YUVhKuFjNY+l5ROfitai5k=;
 b=KrxmYlOq8LaEibJeMq2+XqyY+UsEZp90CH11fNV/CnUGo8hFnFKNwatOAJWgLVinr1YikUgX5S9PoN/LFpg4o5pDMxt3UfltGTe+HllL3QGz9MxS7ox/E/YxDbQNLx113HBi1/5Zm5Y56FXENiKJExpUabcEfXeXMz2fH+X8UBRtEmB8HFgAGPd0VEMhkEIpmKRf8qx0yjE3WmauZhqyVk2Q5c8T9SeDOBO8pDX0xGgq6XCKWo+TVh7ND9RMly0LNgFyq6eRon272LsCWRWXZmDoUCoTzydOqcwJqLrRLaU+92R++Dudu4H17iWBDsR7ch441MQo34Z8AiQXoHmGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qvhJY5i/x+yGhWdY1qD1YUVhKuFjNY+l5ROfitai5k=;
 b=CuI/tuKIi0og0poTKHltDpxP2gv5fUud8Z0iGYJpYAxLVKZl6P4bNq1qoiGDj0R/yXcqWJzbOCWDdEpF4SuFUH5Jv199JM082Z2hv2JplSYLEXmGbzzsfDXjTXU5IR0K8oKIfEpJGYDkowF5Mc8bh14jjptnTpyaCELwdhLnVoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:17 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:16 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/14] dmaengine: dw-edma: Add per-channel interrupt routing control
Date: Fri, 17 Jul 2026 14:02:56 +0900
Message-ID: <20260717050308.2144108-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ef543d-4631-41c1-53a4-08dee3c0b5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XsMsVZa2z1xgBBpepy8V75sOuLYvvwnM1AqNpounHOA0p7gIUW1bC+u3Z2ZFOlZGowFU/PiFTMwsC8rUyPKCYRLTS2F12sw3rHxADshVrHzBFPfTq+sUMblRLVGSuSByywewMBsVtSpR2/TY7dM9xYQ/zrqxiKHnaGwB3I48EKltvDypn0Or+1Ez6zpUXSXatF7CSwSqqIDXou8Hi39Q60fhiBAEDbGsaoOwlvVff9+hryesO4xUyJ2wLmYYhWasqqRkfIpWKDDbGcqmh9BBGQHsCU+F2sMzU8joogrLbTgNbr8imeZ+5GOGsmCk5U7YgE7Hl6qic8Ukf8i73z4H73eU4maa42Tgl7IivqbKuxpc1Bi/zazgizbCCM5brrS2q8/9FIQAEbzV9wpLFl+ov2MP1T6cJk/im2OxAZUbmgxwxfa9heS/Nd5u29r93j4JKr5tBSoGEgJ/GLi2hs42rCwLmUiqwY0gG41ae51Y9/1/Nlk1+9d5BT8un9BQav9T1pHIVMTo1COZnMccPbRWE92Qa3iPAVGiq3jhAp8IwTHT/KVYiynW1Ve7gb/5VT4Rz1pxIn6/mSEaiXkFiMh7NThayFrEfCLF5p92C1hm6d1dM97oAdv/xkilczjPcyaUv+e3QWNJvyBQt7DeE3MYDIJcvFG6XFPHj9DK+1h5q74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mECjvAULE4cqB3euakQRDnljMuBwQtpu/HwhBRKS1eDz48shKX4D6zgYFtPI?=
 =?us-ascii?Q?8MTe4u4UAVryhsFAFQaOfFW8VBdvKEAJH0YJEH2IO4J72VZ9E0qbojY5F3qV?=
 =?us-ascii?Q?yR14iko97e8S5BSN6G1BAyH3iI5+qYMHQqA9dY1vsRQAcVkeOFDQHroRGSfF?=
 =?us-ascii?Q?jAxYU+vFqW9QPEqAy02VIW3c/vie2KyosAsVWT3RECP72zbkohcVZU9buwa2?=
 =?us-ascii?Q?kMLg787pJc94WCrgJQqKWLdijarnhGR8kYEuDYncdFW0cnchPCP6OOZKsvlK?=
 =?us-ascii?Q?38hEqlMmrB4ix3th0S8E4vXel7uviALLvxVBSE6JYkOSPSbg0e6m2uiWOGqP?=
 =?us-ascii?Q?sM/VLO/OGus+VZFifq0J9vl3Hy6hFSjMcdhxOYBLJtfKnT9JraWLx0IjR3+f?=
 =?us-ascii?Q?m9WpXxGiN2PSzF2uUqLpTa9Ze7g4WjBimYmPmMHJ5P/8zkzgiWqW8nVoF9N7?=
 =?us-ascii?Q?DXLzOolmik8IB5P5W+rcmFgT5V9xslmpki2FeDeLcUQO/yrRspjgYNRzxERZ?=
 =?us-ascii?Q?ghF11oPx6YvoDchGPWawNDa05GlmBdCDhv7rgGiz6++mT5qe6mDabBhJs+kD?=
 =?us-ascii?Q?cbfd/FHp2ZK2APcK667WqoKXlJgoL3nwPZX+aSEgjkDtsvuh/32zrkEicNVh?=
 =?us-ascii?Q?kHS6TuQ5AGL/GiqjHRoqlqdD7NOajqg3SUtj0JoCrm79xiDMgOcRzkMm8WBs?=
 =?us-ascii?Q?HzPWaTxMkEob7jccXGib8XFZaQr+yvxwXQBbLazCAP77E32KeCBYpQttdC77?=
 =?us-ascii?Q?l4Dq7sFDRPtht94n4iZE3Q693B9TdEXoMwuHHDGhtC9RZWSv2RV3xm4bRCRL?=
 =?us-ascii?Q?n6nkp+MCImzbULAggqZWe1xwSWI7Qr7QryUkCiSwCITrrCBHKNGqfksSBY2h?=
 =?us-ascii?Q?VoMCy+y+n4BPjJIkY+PxzBpeieM5cepiLdw/way/F01Plntpe8stBd3RaOAA?=
 =?us-ascii?Q?ntwP3p4aPhbYgMWRLN1IkWiYE7VvTzfcw30yld0aL2NU1MButPChX+zYDoCc?=
 =?us-ascii?Q?o/x4r9MAvosSAf5+/Kp7G6fz7S/MHLrtCteQ9MLeS9x7sRcSDP4dGTLTwo3H?=
 =?us-ascii?Q?HcmhfSALIaRUdXerz+fh7KNdIHgMQq3xlDKfWC/iab3qE/sJNcCMgfEFA+NC?=
 =?us-ascii?Q?wzNggfDGTa6qS93VoxFN9fsyYO7+iYCmZRdPWVbShsYq1E5daNbW8TcqBaQH?=
 =?us-ascii?Q?Z1iiQPNWDuStg7LLDl7Dl7fZoG+yN+uc3/r5wrhgmCVHCns3EiWMGM85mwCU?=
 =?us-ascii?Q?Tm28d63p2aRIy0si7m4F65UlUrKX3xmgVjQk67wzupJzn3dvzIcc785ZeweZ?=
 =?us-ascii?Q?qHeU1/Ytsj5iNfGww2PgRxulMmJMWEkIFciBGanX68xQ3H4eI+j1m5RvLEMk?=
 =?us-ascii?Q?W6bYMC+8JcdlIM/+LuF+hLJJ7APJMPKi95+Y0Neec5SLP8ZSUkVa8/jwMClG?=
 =?us-ascii?Q?uIhM8pz6DNl4vGphtIgKjI20Qke8iFcuVCWyolvz2ulrdofaMiPP3Vv9Pngf?=
 =?us-ascii?Q?zmHZRkoLu9OLTdhS1LUp05ApLX30aQ7+H3vNDcAQIZxRfvsoSeMO2heVweKg?=
 =?us-ascii?Q?SECwcTk6G/q9rVtW2GWDO1GlOmVw3/I9cVmmsV9cPgSKV9f/ts0wEUR/nDgq?=
 =?us-ascii?Q?6rvFBohojUtxmvSRUyoFUrWIqwNBsjmDBcccZ/ox+kmoscXCCVVzMv0l6sB9?=
 =?us-ascii?Q?qQ92zG8wYHpGPh7wkJMnXIRjTpefZRfjeNVCspCi27zAp3ySgsWHPwx+zNHs?=
 =?us-ascii?Q?CmPn4JtyBSKyjqcDXeX07geHZJePM/CAUsm8YG/7LWqfDXJAxDT0?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ef543d-4631-41c1-53a4-08dee3c0b5e0
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:15.9330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHgmk8Vw4EKAr77KEcXHHVlkd5VZKIfdXPNgTvsGlZFTjChtChB6xWLYXgloMLvQhuzPrseFK35u0YYHOhyMGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

DesignWare eDMA can signal completion locally through edma_int[] and
remotely through IMWr/MSI. When channels are delegated to a remote
frontend, the local endpoint side and the remote host side must not both
service the same DONE/ABORT status.

Add channel interrupt routing state and initialize it from the
controller instance configuration. Update the eDMA and HDMA native paths
so linked-list interrupt generation, HDMA non-linked-list interrupt
enables, and DONE/ABORT masking follow the selected mode. For HDMA
native non-linked-list channels, keep the local stop/abort enables set
so status is latched. In remote mode, also enable remote signaling and
mask the local interrupt pins.

Keep the existing dw-edma-pcie host-side instances in remote interrupt
routing mode so their IMWr/MSI completion model remains unchanged after
local routing becomes the zero value.

Note:
- The routing mode describes where a channel should report completion.
  It does not by itself say whether this dw-edma instance owns the
  interrupt status. A local instance must ignore remote-only channels,
  and a remote instance must ignore local-only channels, even if such
  interrupts are unexpectedly delivered. Otherwise the non-owner side
  could steal the interrupt from the owner by clearing shared DONE/ABORT
  status.

Cc: Devendra K Verma <devendra.verma@amd.com>
Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Keep LSIE/LAIE set for STOP/ABORT status latching and mask the local
    interrupt pins in remote mode. Fix the v4 regression observed on
    HDMA 6.30a.

 drivers/dma/dw-edma/dw-edma-core.c    | 10 +++++++++
 drivers/dma/dw-edma/dw-edma-core.h    | 13 +++++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 30 +++++++++++++++++++++----
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 25 ++++++++++++++-------
 include/linux/dma/edma.h              | 32 +++++++++++++++++++++++++++
 5 files changed, 98 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 30eeb7bffad8..8a1ec0fd057b 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -133,6 +133,15 @@ static void dw_edma_device_caps(struct dma_chan *dchan,
 	}
 }
 
+static enum dw_edma_ch_irq_mode
+dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
+{
+	struct dw_edma_chip *chip = chan->dw->chip;
+
+	return chip->flags & DW_EDMA_CHIP_LOCAL ? DW_EDMA_CH_IRQ_LOCAL :
+						  DW_EDMA_CH_IRQ_REMOTE;
+}
+
 static int dw_edma_device_config(struct dma_chan *dchan,
 				 struct dma_slave_config *config)
 {
@@ -818,6 +827,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->configured = false;
 		chan->request = EDMA_REQ_NONE;
 		chan->status = EDMA_ST_IDLE;
+		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_region = chip->ll_region_wr[chan->id];
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 3c958ca05144..90ca88f5443a 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -74,6 +74,8 @@ struct dw_edma_chan {
 
 	struct msi_msg			msi;
 
+	enum dw_edma_ch_irq_mode	irq_mode;
+
 	enum dw_edma_request		request;
 	enum dw_edma_status		status;
 	u8				configured;
@@ -247,4 +249,15 @@ dw_edma_core_db_offset(struct dw_edma *dw)
 	return dw->core->db_offset(dw);
 }
 
+static inline bool
+dw_edma_core_ch_ignore_irq(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	if (dw->chip->flags & DW_EDMA_CHIP_LOCAL)
+		return chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
+	else
+		return chan->irq_mode == DW_EDMA_CH_IRQ_LOCAL;
+}
+
 #endif /* _DW_EDMA_CORE_H */
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 7b4933c66f9f..9f4f8a93ed0e 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -256,6 +256,9 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 	for_each_set_bit(pos, &val, total) {
 		chan = &dw->chan[pos + off];
 
+		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+			continue;
+
 		dw_edma_v0_core_clear_done_int(chan);
 		done(chan);
 
@@ -267,6 +270,9 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 	for_each_set_bit(pos, &val, total) {
 		chan = &dw->chan[pos + off];
 
+		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+			continue;
+
 		dw_edma_v0_core_clear_abort_int(chan);
 		abort(chan);
 
@@ -354,12 +360,17 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 			break;
 		}
 	}
-	/* Interrupt unmask - done, abort */
+	/* Interrupt mask/unmask - done, abort */
 	raw_spin_lock_irqsave(&dw->lock, flags);
 
 	tmp = GET_RW_32(dw, chan->dir, int_mask);
-	tmp &= ~FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
-	tmp &= ~FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
+	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE) {
+		tmp |= FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
+		tmp |= FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
+	} else {
+		tmp &= ~FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
+		tmp &= ~FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
+	}
 	SET_RW_32(dw, chan->dir, int_mask, tmp);
 	/* Linked list error */
 	tmp = GET_RW_32(dw, chan->dir, linked_list_err_en);
@@ -474,7 +485,18 @@ dw_edma_v0_core_ll_data(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 	if (irq) {
 		control |= DW_EDMA_V0_LIE;
 
-		if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
+		/*
+		 * A local instance never issues transfers on a remote-routed
+		 * channel: on CHIP_LOCAL instances, REMOTE routing denotes a
+		 * channel handed over to the remote side, which programs the
+		 * linked list through its own instance. The remote-only
+		 * recipe (LIE|RIE with the local interrupt masked) is thus
+		 * applied by the instance that owns the transfer, and the
+		 * LIE-only write below never executes for a remote-routed
+		 * channel.
+		 */
+		if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) &&
+		    chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
 			control |= DW_EDMA_V0_RIE;
 	}
 
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index b455da3d9b0f..52f54e14544d 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -51,15 +51,22 @@ __dw_ch_regs(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch)
 
 static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 {
-	if (chan->non_ll)
-		val |= HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK;
-	else
-		val &= ~(HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+	val &= ~(HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_REMOTE_ABORT_INT_EN |
+		 HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_REMOTE_STOP_INT_EN |
+		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK);
 
-	val |= HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_LOCAL_ABORT_INT_EN;
-	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		val |= HDMA_V0_REMOTE_STOP_INT_EN |
-		       HDMA_V0_REMOTE_ABORT_INT_EN;
+	/*
+	 * HDMA_INT_STATUS.STOP and .ABORT are latched only when LSIE and
+	 * LAIE are enabled. A remote handler needs those status bits to
+	 * identify the source of the IMWr, so keep local generation enabled
+	 * and mask the local interrupt pins instead.
+	 */
+	val |= HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_LOCAL_STOP_INT_EN;
+
+	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+		val |= HDMA_V0_REMOTE_ABORT_INT_EN |
+		       HDMA_V0_REMOTE_STOP_INT_EN |
+		       HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK;
 
 	return val;
 }
@@ -147,6 +154,8 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 
 	for_each_set_bit(pos, &mask, total) {
 		chan = &dw->chan[pos + off];
+		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+			continue;
 
 		val = dw_hdma_v0_core_status_int(chan);
 		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index 1fafd5b0e315..d29a8df76f8c 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -60,6 +60,38 @@ enum dw_edma_chip_flags {
 	DW_EDMA_CHIP_LOCAL	= BIT(0),
 };
 
+/**
+ * enum dw_edma_ch_irq_mode - per-channel interrupt routing control
+ * @DW_EDMA_CH_IRQ_LOCAL:     local interrupt only (edma_int[])
+ * @DW_EDMA_CH_IRQ_REMOTE:    remote interrupt only (IMWr/MSI), without
+ *                            delivering local edma_int[].
+ *
+ * DesignWare EP eDMA can signal interrupts locally through the edma_int[]
+ * bus, and remotely using posted memory writes (IMWr) that may be
+ * interpreted as MSI/MSI-X by the RC.
+ *
+ * For the v0 eDMA linked-list programming path, DMA_*_INT_MASK gates the local
+ * edma_int[] assertion, while there is no dedicated per-channel mask for IMWr
+ * generation. To request a remote-only interrupt, Synopsys recommends setting
+ * both LIE and RIE, and masking the local interrupt in DMA_*_INT_MASK. See the
+ * DesignWare endpoint databook 6.30a, Linked List Mode interrupt handling
+ * ("Software Programming of an Endpoint's LIE and RIE Bits for Linked List
+ * Transfers", Attention).
+ *
+ * A local (DW_EDMA_CHIP_LOCAL) instance never issues transfers on a
+ * remote-routed channel: REMOTE routing on such an instance denotes a channel
+ * handed over to and driven by the remote side, and the recipe above is
+ * applied by the driving instance.
+ *
+ * HDMA linked-list watermark interrupts have the same LWIE/RWIE guidance. HDMA
+ * non-linked-list mode has dedicated local and remote stop/abort interrupt
+ * enables.
+ */
+enum dw_edma_ch_irq_mode {
+	DW_EDMA_CH_IRQ_LOCAL	= 0,
+	DW_EDMA_CH_IRQ_REMOTE,
+};
+
 /**
  * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
  * @dev:		 struct device of the eDMA controller
-- 
2.51.0

