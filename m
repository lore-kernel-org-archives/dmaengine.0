Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021086.outbound.protection.outlook.com [52.101.125.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1040912B;
	Tue, 21 Jul 2026 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615318; cv=fail; b=nSnjkvIgowj6+tlK5gv3rCTP2F9YGrhj+8T9ua1tv7Wr/aRIxvKi4PMjB3QxxdtcPsLjr/mIn+C90WZr9EteJUCXNtn07HiR9KKNo8vX5RYh7474TMcrMi1qvODgeiAhOPVTBsB0vSomTVi2zHS6tpJv8rYry4f7b86YMKa53cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615318; c=relaxed/simple;
	bh=muhLf+rWO2eRDYLIlYf0t/cbp2mwBNMlJMUGAJBFtBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sOyLVY4jAst+pSCj9vME47R9bWkCw5ZPfjeBQb5OEy6bB6C0RpRdntcMlYNkcHawHyyxnjrfGAp4iJGFBcAdbW5OfQjYQwrW6j/+F2Q/4oSAIRYV2b+dDTklfHiYc0Rn25TWh/kf/RLHzQoGpPzEuWvpBwTEtxzk6BCSlo7MJUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=AkgpimRf; arc=fail smtp.client-ip=52.101.125.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="AkgpimRf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsj20jxPJo7DPPCPcLtSEyXipAigCT/2Vyo5pkkBbcFscogCAiOvWD4kq7qsB8lkMgEH4864zBAOObW3VwsuZw4tOVxmTEQralw96bG/fwGmLV3IvPRV9JUitPSsLY5riKUCOwv+WvwyMzKSC5/siAqujN8FioRPAysLgykJCM6CjqLRgi9TNaa8vx1gRK4kcRluiKdfBVx3z309mBXLLSy45ED3rRh5Y+az36m56xEKcGqpo9pYG5j2YQZbBhqp/H8Q7RbvoflFuFua92QVwuV+O4SYcLz6+X0XCzV8TbGxSwESLYtYiXRdP5Qh8g1RnBCarsSCPPEhigHVIrPf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7caWih/uOyi+SlcSVqZpZ9D8prz6XtNXFCmlHqzM+jk=;
 b=JQn6Slq1tIX8Iutbi6bq4YeffXi0mWqPOHYzEdmBpUBCrj9DnAA+nVm3Hl7eotWVIpS+JiqDlS6HJ4YXA7r7UVx/aQHwGr7jKFGn7ATvRxoR54R5toksz/I7/gmmUdGyTRP99M/SB7Xupp/jm3+HMzeVd6KqmgX2bdtkjegsy5JG9fhOD6RPa4JAyOXIsI56LCQRZvzo60PuBkknNK5goBbKOB5jNyowMy2mJDAx6/08IXIxG63EGukE22WMIzq6kGdB9LxwzssVr3S0VO4/tvcgOHLh5SBB2aaRxDQoKncOqZTXA4ZhcNLaYnRBeVsOHxATvoC40YJtpT0l2KzdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7caWih/uOyi+SlcSVqZpZ9D8prz6XtNXFCmlHqzM+jk=;
 b=AkgpimRfschBXm8NvxOQHYJ8Pg48QNykOBsHHviv4phc7kENA5PNh1IJK7/7U2LOal+VS5GZvJ1KSfI6nveTwicGQ/haU8MKxIN7BirKaYnVGZgrVxLigBMHjT8floLWy8jtqA2LN05RFtdvE0YMqs3YBtEl2nBOPFw1fgeWKuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:23 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:23 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/14] dmaengine: dw-edma-pcie: Add capability match data
Date: Tue, 21 Jul 2026 15:28:08 +0900
Message-ID: <20260721062815.4117887-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc70e27-b97b-4e59-2b11-08dee6f143d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O+fPUOlq7F3UqP6dRPhewolu8mmOvy4OwXqHJ6YgWcBAHvz6f2weyKqk1FY9+ebCxPaHZxr0tdXfOi9gC9+2Fvu+jELehDOLNLHst1tFxHgrja186pHn12uHeft+MYFAm+GAk+iLE9E4dHRx2z8EgZPFuHZpH0AEh+lhx7S8na26GdweFax3AYLU/d99g+BNu1hjfC1HjbTDb5GsDhg7obK5jGbJze9DGa/DToW0+wHcgX/vsJ8qOzuVgzEwxuMKovJRqRXBwKUm123sOnJWDK+fzdazvtpAkh4FkOK9zSBLvadb+Q3AOEYBhgTnX+F6luHD916dodv11UA/2qO383pi+Jamna/xdJ/ObQfj9VWBoX2XyW6icjPbaaXLSv5a22WhUr9JGesJujaWjBN3qrOpIwgKC1yLQJqyujCsayQR/My1YgeJQZu2Y4UedGgBbo5iTsff+I89TgHEJmMHhk2pLdtHTQmLC8chwZeQn2ZdpCRpnax7b8SJN6TSVL/g8hMW2FBZFbNu901nZAN8U2Ss+x2z0IIyXnoEH150W6WILkXey5hkob1/sVAbUMpZ8qgOc9KiYVjGncDdgqnN+U+4gxVpbPDgVBEv1Zp/mWNrQtE2HcPEEy21odN4f8nJ6HLftXwXu89SRTZp48RaXIZUZzmuZh7PG/ttRJo96qg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UJV8PsI6GsVbsJnJzPkaEESwCuYgO2uu6beKUbUXwpFUBTZyIZNt5dJH6IFD?=
 =?us-ascii?Q?S/mP0HgdMhzYJE/ogWLUcg8molp6rTFDHR4koajvNeZGxVrkzt0k6gr6bZ8o?=
 =?us-ascii?Q?rTheHiCaQLkTFSzQ1f0WTu7kDpe3COwlevek/HG8FX3EW7OM2mg63Fb6dtBC?=
 =?us-ascii?Q?GKxPQy0DFACi6spChaUXiFAswHNtbIuy50TAQ1ZxOOqstmoBuKIiLhRQuGvx?=
 =?us-ascii?Q?JdpbJ7SlqMDG0wrCnbUZN0CRTgCx3UAIA94wnnRrJSMhyRcBshiSq82BQusl?=
 =?us-ascii?Q?mncZMnuxU6nPcInVrLSh5Trn/30gC7/j60b9IxaQ2MYS/2bSbs/76BOP3Etm?=
 =?us-ascii?Q?ugxYY3Zj1cgSwN0Y/K2iJ06nIwOjbzjq9XepkpNEG11E6iIN8veLbItGRsko?=
 =?us-ascii?Q?sxIsEWSi6TiCjBpjaZGX4bER+2ZTGOucuOnt6IRv3peETAWMTWxT/ef/w/K0?=
 =?us-ascii?Q?ODRI3rWZH5snFYjMHbqpZ4SLGjLUEFeUlJJIHS2rLOHxoKrGdNZnbUMOEVab?=
 =?us-ascii?Q?e0kHDhn51KmpUs/lPDJVGUGTsnZ+RMtt38LdDmfUvrsYwyQRTNvQ9A/Sy4Xo?=
 =?us-ascii?Q?ez1sGLTgW8+thuZtDrUTm3dW7BVahHia9mCtc0Jj0MKl3sUtXaUE6dP44PZj?=
 =?us-ascii?Q?8xT60rICe/z87qbmT8kNNwU1HNRSIYAdG5z1XCdwvsVZ0nUtKBhcT0dMJAUR?=
 =?us-ascii?Q?qmyFXR7GIun1wFe2WhvEt9oYmmXXs662FvE+2OrtW6xZgq+0Iv3elm9zuyIn?=
 =?us-ascii?Q?P4cTSsLbxpS0svNDmvyQLCh2/1oss1qMgygWjU+1QmIpqg80eg7jYCYIqG8v?=
 =?us-ascii?Q?X3E24XeAhMbNw+rsbloENIPiFrapeAEE2rM8+fjoNpJOjd+AADemwaOsAFTn?=
 =?us-ascii?Q?g02qTRqKvJhGCnkP3xfcH4m8IgxzUAkCBLHE6IAW8QT0EFWU+qxnTcuAuds8?=
 =?us-ascii?Q?ip75JMk4M4E/U1XNAxooRgrcejxJa83bRAe/1Y+Gkow+SRDtSPwt4EMKJyxz?=
 =?us-ascii?Q?guNFwOKFAyA/wdgz+VlXGF43qDBJANNTC7aKF5G1k2kGUR9sgaPeT4K8b6/U?=
 =?us-ascii?Q?eDvUwSU8qQpfLN1YE0H51lGA8xHSBg22dwDbWToPSyekxhKHc58rgVuxhnUi?=
 =?us-ascii?Q?TO8vFbgt2B+jCvIIPWDXWcMnKSgeGcd5HnErM8xNeYEK9gsvdDVWAvSL35WV?=
 =?us-ascii?Q?OMrLwxrTwWfH8BTt6UoDjEE6d72bQch0NAmDxZVd4mBY9jDLot6x8MOuHmiz?=
 =?us-ascii?Q?Yc8jzxPL9Hrpyz8fsHfU3tOCBThk1pU4LwFr3YpchYt32oia5OhK1XpAAZfz?=
 =?us-ascii?Q?BYH6mMdPDOKo4VlHEkTmFK78ye+E23Q5H1naAoFoDG9X66rUNu0PK0pFbHRO?=
 =?us-ascii?Q?wxTI3d0xkpduDpWp1wcg/OQWyoFfs/qcDWwLthjomQEIMxkCSZCBJ4gGUrEI?=
 =?us-ascii?Q?xx6ZYo8xIBAvWkktqd4wT/nsnoaUx/+2krP0RI9iShiqeLWwuMdwjSGuanGi?=
 =?us-ascii?Q?na1aI5ACmqz+khebjjaICgwzli2xljYPgOVPxgHTo4U9BBLU+GfcPTkezK69?=
 =?us-ascii?Q?UpBCw5v81vBwItPqCvC744PxUiEbnYhRWi2sy8VskK+yF7eEvyb3YsNsCSup?=
 =?us-ascii?Q?wYc32KO4SDXGOmH3KUQpgZ19yDbN97AxLc3ffu+9pesvb079OFZU9WnbF8Hh?=
 =?us-ascii?Q?HkdiR6v9AGmrhWy0wUW3YLI/QA6k/9rxXp1z5P3F+VL0xz2U8xHsM0VMFI41?=
 =?us-ascii?Q?/17bTW8QpAcnRpTyVCHrBBCiD/rkBkPW9H6ahu5qbiD++Nn1FkW0?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc70e27-b97b-4e59-2b11-08dee6f143d0
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:23.3122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5VTmFN3aXxEZZVEbONIV3jrelKzAUCYxe7vIGPeCnjJ3nBx1spXHN4IqYtaLy0XE1nLyJgqpaebS1tBXP2psQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

Move device-specific capability parsing behind per-device match data.

The existing probe path mixes two decisions: which static template a PCI
ID uses, and which device-specific capability parser adjusts that
template. Split those decisions so device-specific discovery can be
added through match data instead of adding more vendor checks to
dw_edma_pcie_probe().

No functional change is intended for the existing Synopsys EDDA and
AMD (Xilinx) MDB/CPM6 matches. They still copy the same static template
data and run the same capability parsing logic before BAR mapping. The
AMD (Xilinx) MDB/CPM6 entries also keep using endpoint memory physical
addresses for descriptor windows through a new match-data flag.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 139 ++++++++++++++++++++---------
 1 file changed, 96 insertions(+), 43 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 9b3d3df2ffcd..50d2a53f798d 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -76,6 +76,19 @@ struct dw_edma_pcie_data {
 	bool				cfg_non_ll;
 };
 
+struct dw_edma_pcie_match_data {
+	const struct dw_edma_pcie_data *data;
+	/*
+	 * Mandatory callback. It may leave @pdata unchanged when the static
+	 * template already describes the device.
+	 */
+	int (*parse_caps)(struct pci_dev *pdev,
+			  struct dw_edma_pcie_data *pdata);
+	unsigned long flags;
+};
+
+#define DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF	BIT(0)
+
 static const struct dw_edma_pcie_data snps_edda_data = {
 	/* eDMA registers location */
 	.rg.bar				= BAR_0,
@@ -310,24 +323,70 @@ static void dw_edma_pcie_get_xilinx_dma_data(struct pci_dev *pdev,
 	pdata->devmem_phys_off = off;
 }
 
+static int
+dw_edma_pcie_parse_synopsys_caps(struct pci_dev *pdev,
+				 struct dw_edma_pcie_data *pdata)
+{
+	dw_edma_pcie_get_synopsys_dma_data(pdev, pdata);
+
+	return 0;
+}
+
+static int
+dw_edma_pcie_parse_xilinx_caps(struct pci_dev *pdev,
+			       struct dw_edma_pcie_data *pdata)
+{
+	dw_edma_pcie_get_xilinx_dma_data(pdev, pdata);
+
+	/*
+	 * There is no valid address found for the LL memory space on the
+	 * device side. In the absence of LL base address use the non-LL mode or
+	 * simple mode supported by the HDMA IP.
+	 */
+	if (pdata->devmem_phys_off == DW_PCIE_XILINX_MDB_INVALID_ADDR) {
+		pdata->cfg_non_ll = true;
+		return 0;
+	}
+
+	/*
+	 * Configure the channel LL and data blocks if number of channels
+	 * enabled in VSEC capability are more than the channels configured in
+	 * xilinx_mdb_data.
+	 */
+	dw_edma_set_chan_region_offset(pdata, BAR_2, 0,
+				       DW_PCIE_XILINX_MDB_LL_OFF_GAP,
+				       DW_PCIE_XILINX_MDB_LL_SIZE,
+				       DW_PCIE_XILINX_MDB_DT_OFF_GAP,
+				       DW_PCIE_XILINX_MDB_DT_SIZE);
+
+	return 0;
+}
+
 static u64 dw_edma_get_phys_addr(struct pci_dev *pdev,
+				 const struct dw_edma_pcie_match_data *match,
 				 struct dw_edma_pcie_data *pdata,
 				 enum pci_barno bar)
 {
-	if (pdev->vendor == PCI_VENDOR_ID_XILINX)
+	if (match->flags & DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF)
 		return pdata->devmem_phys_off;
+
 	return pci_bus_address(pdev, bar);
 }
 
 static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			      const struct pci_device_id *pid)
 {
-	struct dw_edma_pcie_data *pdata = (void *)pid->driver_data;
+	const struct dw_edma_pcie_match_data *match = (void *)pid->driver_data;
+	const struct dw_edma_pcie_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct dw_edma_chip *chip;
 	int err, nr_irqs;
 	int i, mask;
 
+	if (!match)
+		return -ENODEV;
+	pdata = match->data;
+
 	if (!pdata)
 		return -ENODEV;
 
@@ -345,36 +404,13 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 	memcpy(vsec_data, pdata, sizeof(struct dw_edma_pcie_data));
 
-	/*
-	 * Tries to find if exists a PCIe Vendor-Specific Extended Capability
-	 * for the DMA, if one exists, then reconfigures it.
-	 */
-	dw_edma_pcie_get_synopsys_dma_data(pdev, vsec_data);
-
-	if (pdev->vendor == PCI_VENDOR_ID_XILINX) {
-		dw_edma_pcie_get_xilinx_dma_data(pdev, vsec_data);
-
-		/*
-		 * There is no valid address found for the LL memory
-		 * space on the device side. In the absence of LL base
-		 * address use the non-LL mode or simple mode supported by
-		 * the HDMA IP.
-		 */
-		if (vsec_data->devmem_phys_off == DW_PCIE_XILINX_MDB_INVALID_ADDR)
-			vsec_data->cfg_non_ll = true;
-
-		/*
-		 * Configure the channel LL and data blocks if number of
-		 * channels enabled in VSEC capability are more than the
-		 * channels configured in xilinx_mdb_data.
-		 */
-		if (!vsec_data->cfg_non_ll)
-			dw_edma_set_chan_region_offset(vsec_data, BAR_2, 0,
-						       DW_PCIE_XILINX_MDB_LL_OFF_GAP,
-						       DW_PCIE_XILINX_MDB_LL_SIZE,
-						       DW_PCIE_XILINX_MDB_DT_OFF_GAP,
-						       DW_PCIE_XILINX_MDB_DT_SIZE);
-	}
+	/* Let device-specific discovery override the static template data. */
+	if (!match->parse_caps)
+		return -EINVAL;
+
+	err = match->parse_caps(pdev, vsec_data);
+	if (err)
+		return err;
 
 	/* Mapping PCI BAR regions */
 	mask = BIT(vsec_data->rg.bar);
@@ -441,8 +477,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			return -ENOMEM;
 
 		ll_region->vaddr.io += ll_block->off;
-		ll_region->paddr = dw_edma_get_phys_addr(pdev, vsec_data,
-							 ll_block->bar);
+		ll_region->paddr = dw_edma_get_phys_addr(pdev, match,
+							 vsec_data, ll_block->bar);
 		ll_region->paddr += ll_block->off;
 		ll_region->sz = ll_block->sz;
 
@@ -451,8 +487,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			return -ENOMEM;
 
 		dt_region->vaddr.io += dt_block->off;
-		dt_region->paddr = dw_edma_get_phys_addr(pdev, vsec_data,
-							 dt_block->bar);
+		dt_region->paddr = dw_edma_get_phys_addr(pdev, match,
+							 vsec_data, dt_block->bar);
 		dt_region->paddr += dt_block->off;
 		dt_region->sz = dt_block->sz;
 	}
@@ -468,8 +504,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			return -ENOMEM;
 
 		ll_region->vaddr.io += ll_block->off;
-		ll_region->paddr = dw_edma_get_phys_addr(pdev, vsec_data,
-							 ll_block->bar);
+		ll_region->paddr = dw_edma_get_phys_addr(pdev, match,
+							 vsec_data, ll_block->bar);
 		ll_region->paddr += ll_block->off;
 		ll_region->sz = ll_block->sz;
 
@@ -478,8 +514,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			return -ENOMEM;
 
 		dt_region->vaddr.io += dt_block->off;
-		dt_region->paddr = dw_edma_get_phys_addr(pdev, vsec_data,
-							 dt_block->bar);
+		dt_region->paddr = dw_edma_get_phys_addr(pdev, match,
+							 vsec_data, dt_block->bar);
 		dt_region->paddr += dt_block->off;
 		dt_region->sz = dt_block->sz;
 	}
@@ -557,12 +593,29 @@ static void dw_edma_pcie_remove(struct pci_dev *pdev)
 		pci_warn(pdev, "can't remove device properly: %d\n", err);
 }
 
+static const struct dw_edma_pcie_match_data snps_edda_match_data = {
+	.data = &snps_edda_data,
+	.parse_caps = dw_edma_pcie_parse_synopsys_caps,
+};
+
+static const struct dw_edma_pcie_match_data xilinx_mdb_match_data = {
+	.data = &xilinx_mdb_data,
+	.parse_caps = dw_edma_pcie_parse_xilinx_caps,
+	.flags = DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF,
+};
+
+static const struct dw_edma_pcie_match_data xilinx_cpm6_dma_match_data = {
+	.data = &xilinx_cpm6_dma_data,
+	.parse_caps = dw_edma_pcie_parse_xilinx_caps,
+	.flags = DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF,
+};
+
 static const struct pci_device_id dw_edma_pcie_id_table[] = {
-	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, &snps_edda_data) },
+	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, &snps_edda_match_data) },
 	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_XILINX_B054),
-	  (kernel_ulong_t)&xilinx_mdb_data },
+	  .driver_data = (kernel_ulong_t)&xilinx_mdb_match_data },
 	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_XILINX_B00F),
-	  .driver_data = (kernel_ulong_t)&xilinx_cpm6_dma_data },
+	  .driver_data = (kernel_ulong_t)&xilinx_cpm6_dma_match_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, dw_edma_pcie_id_table);
-- 
2.51.0

