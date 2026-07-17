Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020142.outbound.protection.outlook.com [52.101.228.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F19223DD4;
	Fri, 17 Jul 2026 05:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264610; cv=fail; b=G+nzteyjrhVutVRUlxqdXsuvYkmtLfzgj8Vx8LYZtcOme3TEUrmalWMgOmK8bU+tdGusHxJ/IMCCc7u0//bz7Yzd0JlzsbXvBYdKXhNNisw6oDHMmzz3Q8r+9eAhYKXKl8dyRaIlUiC141MBA8tYa0VZ0jLBoJH79055UJqeQvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264610; c=relaxed/simple;
	bh=g7NomjkKgZfnfhiH2BiXyCuD7pzRmNJ3QlTTlHRSu3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nFSr2eDF1tI2jIygod81CDAVxHEgUk8vRd1gV5M6X8duKHcxZv1+B66NPdpsK1rvI7samBOhgDWdCQ7EcbM5ipL2G6LGPVddDjVXch5uFxdnZuSzDf5hcgObKQcvxrYAG+nSbOdyqXzkSEikupC3yLplgpQwrkX6KYHTYJPzjqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=lR2bM5w3; arc=fail smtp.client-ip=52.101.228.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="lR2bM5w3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZa/ZEDzHYIEYhhVa2eGDY6fgFqN2OzVcAMOJdeMx5yhJNwltynkMWJ0blGvDhn7mbF2PO1JvqmHq9eN7JY2jBr2EA6Hc+QwIFllyl8/XbFzvGgCJpLEp4FVygk14wyLNJXKgM5TO39dEdqc2liHbBU4jFo5h3//RkgNnAYdpcBssmo+bMjItEqqTR7GirM/centKfB7DW48Ue59149pRBm5FVRjlcTEf61Ergg4j/fEi3cYxspS/bkhM2yqas2nxXs1IH56Gx06+TlqKsXvSdsxI8xl/gxExSHDXh/RaeJcqoyJnY3JFKGFymvxDHFExJnnVng5JyAOKwEKJ0jJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2AJGtKfChKDPfbiktCos7nVAQUjOJ/XWuLHtvjClEU=;
 b=Z/4QDxN7dxzxOjH7ez3NE40321sdb803g2KM7y2Jh+QofaTWiR7c8+JhTnF3BEuT/0WsoAxPBMSiTmVWqh6wQFMhHRzext5ccWU6QE4VYGNkm/O6lsdoWZtjqiX44fOfHyM63qwjQVT6fwElriLveEmbtVRLj7iHG/hMSS9R43UVX8PQ3gANL+W59H1bm12sw2YtYj0C6jncyaz0C1eIFwQi2aFcse2r0gwEmjNg82Ocl8RYkBJ11ihlRcy1r0HFuN4rVYM5cCBq09bJAgyG4LeFuEPK8vLH36kvkKWZesydQcwvTLtjjkAQr7XlyJD9Uiq7gkpYpJPeUfAXu4efLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2AJGtKfChKDPfbiktCos7nVAQUjOJ/XWuLHtvjClEU=;
 b=lR2bM5w3g1BcNzBDkjudXU1WJBAGpVjDfS0aubg9269S4cuZfW0wFiYKGAY8KxKNOOkGqh6oUpXGUBkLl899T5v6uljFRKnah81Py4uIohr/2SWhZu+DHmyrbeLcctSOeML1jf4l3cg2sLQfq8+434MBrdhLyAnCUtcW4QrrHjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB5635.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:21 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/14] dmaengine: dw-edma-pcie: Add capability match data
Date: Fri, 17 Jul 2026 14:03:01 +0900
Message-ID: <20260717050308.2144108-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0319.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e2e9f2-f52d-4922-dd8d-08dee3c0b8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10070799003|56012099006|3023799007|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	73Gt/3MtSLSSpkWbbCNCbjNJvEn0iwinzLRR6HnP4+IRsJhbSlkCtr+sMfI+9GiTZHd1W15wKWo8ZNNj0OBac3ViY9m1nwPTP/9tF9DArsyEJnJE8OBjtpmA65YmKGGoQrLYNIq0tgmfeV8i6/xzuPJaW0IvxT3UZeXsfA2Wh92bzUwEIrPtIB4oKIm7rFG8tPAJOzK4M7Vb42LRSHMGyNYvJRGzpKwiqCe1VzUR0+L+xStSdiEI9uJhgr/P+c4/Xx+vy7gzv8jnL/GLFEyEJjm41PZG/b9+L6ipCywm2RDSqMKkTB+0UT6uIYFrvxhjg9pmgjOPsgIJAHkCY5RX9vkdBtyj6NanwqivSSlzyswQ89DPUUZ8c+ZbUwjDV7DFT51Q2q/x+spcENClv4T5w5oatmwaQDpcBnok5MuKakY/6s0Agz80rHSYmmdoq2VU+DUQKN617AMwVZ7Rmlj7UHEXGbUzq+s8vgWJeh/A//zuGV5J+H4h9ccPo43kX+jsUIIPcvUzaWbG3ZldnLf9ppI9JeEuO7ggxG4FtIb//4aJ2X9eenVp8PPYzQws6oJiQtNp8j3Fthd2byQ6FV6nH1bIfmOTB6pu3NeIai194/Ysn6SR6iwP/KGLZYZaEwV/bzdCU8o7hFHS67+3D3Xk/AgVRwBhbBbDD2vJ8wwagSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10070799003)(56012099006)(3023799007)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MlYrWD3gzn77o2j9SKSvv3TrSw3GV1kj6/E26dNnLCcdx9aYaDK6fkwItwJ2?=
 =?us-ascii?Q?kHpuxmIWzuX8sTJ8FSrVjJ4N38NOHJr4NBEtxQHisQ+u8cUAtdgGxwceeRwT?=
 =?us-ascii?Q?a3cdCbKfmoGUcweSDOB9J0uy+bntgfNAZ/Ovwvxh2lHiJvO2kYVnWFIeJCH1?=
 =?us-ascii?Q?WLSc/mKIC1MVVTwr+yq6BQCiD5oEwwFQc8rIDWUtby3ceVNiqSUQo70RRXx1?=
 =?us-ascii?Q?/h9DUq8JddDXrHrKqErvHIDhQ+rs/tvqMC43jdB1UuotStmM8IPXs9FVFud2?=
 =?us-ascii?Q?USslhqTQA6OjHN0sdXwmgYtmrglU0LZ0Qdriyo6ExSfg/zRshvvEvbzhuwYZ?=
 =?us-ascii?Q?7Iy4Vx7VERxDCGWifUS5Wxf6sZ1lzW3bQyus9UIgdApdxrFFbLO4yyWhlumo?=
 =?us-ascii?Q?73G8I97+6hxT/hp2L/O2nHzB/sKHdi4QeGlGnctFM9dkz1gildrYOZsb2ltf?=
 =?us-ascii?Q?qjKVSBGJVAef5P3SBL3YATbpTO8ltOjoLBIge0kJZb/l2ah16IDBKyrbeqU0?=
 =?us-ascii?Q?a1cxPOz8REvWEX9/puiUuOCQfoHElH/tLkQmyi/vBb0jceLjPzKqD5h8dtdS?=
 =?us-ascii?Q?0vA3BfSLFIaQ9drxCr0MljWSNn7TTmfuZD1PhVRqkpchYxVuW5hGFkF3poEY?=
 =?us-ascii?Q?gQKAJGgDqtZy8nfaKwJyAz1GTCqTKTXXOtplk0Wl18aw1jfppsmYQcLa6n1Y?=
 =?us-ascii?Q?wwKEuFMla+lbj3oXbbYZ9hDBfmb1bM6q0Z3FMoeFv/D3M8VUZp3WdrRyLe9h?=
 =?us-ascii?Q?YNGvuMZjL6LBuYxYX5taCgcRBJVIE2H6HyKKBjDb8w20rOgK/NgPQP7pgITk?=
 =?us-ascii?Q?5lUBWT2oWtUNmE5kGoV12aWQYFO8Yauj2HaEHmyJPAwYH5w4mbmsJ/ufYYCV?=
 =?us-ascii?Q?TE/xR1uHU36j4l6vW5K7EZlaIXiFYqTKsbGGLx0ke0EZtGc2Y4wuzYmsaGia?=
 =?us-ascii?Q?faunRrXJiXeKJ8ci1VTUW8PpcN8Wt1N8MJpe3VXLgyq9Z924DMb5Mbw3h5MM?=
 =?us-ascii?Q?ITgFJ80FbBPq8qC8Nrprdde2kzLsuIe/hKQTzElXb0qtoCk9w8eU9RzuHrZe?=
 =?us-ascii?Q?Qh3qfdpF5g0WZrLeOI5DRuOJfmIkS+VofKMahCGpLK+FCFoeW+gicx4JpN75?=
 =?us-ascii?Q?oRCQuXEUYhGKnF9OhzeFM2Gz8ktUN2+oZAwmPG2GJcrLn+oiYiECNYZJgve6?=
 =?us-ascii?Q?WvvHYcimiCsnhGbAumALBI0Wn1Nwl7t6icBTeGKwDfAUyNUwskCFifjBuM04?=
 =?us-ascii?Q?mI1V02AIqoPVkqEmFkCB/pTsfb1TnjAbxDtkIqwO/zn2p6wGAOhym4Ood9fv?=
 =?us-ascii?Q?nwXuD+vvdrg66Ic0lwP+6B8jMEVDuUl8yNCVMuRhxiBQ9w+jSGfjhDGc60fS?=
 =?us-ascii?Q?ejEW2YDmV1EugqTLp7VB+aMr86sY9IIG2fESWSgBo2hQIpg2Nmt91AEgPssr?=
 =?us-ascii?Q?o1zOZXR1A+pK+lTI9xzS/2wVUBKEa4GkOqOC0x0/JFCmU2VlTQjjO3gM4r/g?=
 =?us-ascii?Q?gjhxW29/to7XSajyuQHNk/VwhGdgFDBH4i3QqLwxt0ZHLNQD3a0WWNXeO4Q9?=
 =?us-ascii?Q?9wB7eL9gSF3OHe9hKWh+Sgmk0jWWafkTzUDC6WvwTCeSvBAX3UfExgo7ebei?=
 =?us-ascii?Q?opEL9+SVchVTrqAnzsmO0hIAAulM/7NYk0aYRMeG2vEoP8G1U/wzR/RkEWst?=
 =?us-ascii?Q?WSgMXrF4+0Qz1XU3e5nfhBnG+xfPwuqz25RHbaL2SELcsHTiUeCOtJvTChr/?=
 =?us-ascii?Q?NbI6Z3g1MoMP/55rjQKGfGWXtpiCqXUgyffxfWb3tea6lNk+b3tp?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e2e9f2-f52d-4922-dd8d-08dee3c0b8f4
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:21.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fco1C2mon9+PFFvErvUki645Cnbdd2HUGQJZDiswpf7FEwZUJhmSjP/cmtcC/lmpPnNS5Rcuiv4CP+cpykEExQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB5635

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
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 139 ++++++++++++++++++++---------
 1 file changed, 96 insertions(+), 43 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 16bb938c6e40..23f09ee89639 100644
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
@@ -560,12 +596,29 @@ static void dw_edma_pcie_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(pdev);
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

