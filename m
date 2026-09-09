Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2763BF66B
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 19:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982651; cv=none; b=YNB7dyq41Z06n1mpznVdtdbSvYRzRgsHGb+pAET6hX482OyXn5a2qGk/Co5hn3avX5L7en+8t9STRrvdzapu33dR4oGIIKixUrVrT88DBkzkCzCFvS8VPKA7Vvkk+ouEe5q414OB+UelxIL1YbInB1JIT2//tAP4DChEUOmcEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982651; c=relaxed/simple;
	bh=C7VwzFJv62xo0oL16lkSPk1ImXglzc2NWBysuU8eCC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MU/SiB16oqJpnS1/2LkQeEjy4fvcD5Tqn4XBZ3vqFYZZWU+moKDjZKGOFmp9fnPM5OLTF/t1oa5kFaeN2uZJMPK7q1C0FHOceOILQRJ4/Gv50ODq+MbSmr/uEJIwCgzZndsGiVk2XDVZqBHdbqGUJnApknj7efWF2RxQcPB+utw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBY0Krxf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBY0Krxf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49954b88fffso45979245e9.0
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982647; x=1789587447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rN/co/MiO63+I4OwBOH7CBrIhRmyKBo1K8jSxxz7cd0=;
        b=BBY0Krxf7a1gFgfyJQCgYaaeYD91c4+dcWVhwgYTm9qLrerNy94U4XBslyKOS05f/j
         5lQTplONBqvup1aGz2Q14BjqiDdZWdXhcNCA8iw3f+QdwLXyOGOQXztAk4ZeFP41YgsM
         Sum9R+H6jRemXw1JK5dIwmABSIFJrprfq3LwwrQ/gI7mLtIXO+UKAlEROPh+enlxxaII
         YAHYGnD674bfCfuxeYVASshxdmVOiZTOOTWb9agr9R686qY3mywcGmTTyhPpWr/tUjRS
         p4VmJMX16W7LdNVrpqzetXPjtTqNdZ1nRZ4uWYejpwXgCSiyBzmQbfXkgjcgOAgGs9oh
         XJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982647; x=1789587447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rN/co/MiO63+I4OwBOH7CBrIhRmyKBo1K8jSxxz7cd0=;
        b=qWI6VMQ5buKwufu1MUv+AmJphMuIiCXnaaN1E8OgrsuHYNhMBZ2zxnUEtgGOjKypX0
         2sj3taWcxje1+Qbg9iP5fz2yReC1tCaSDJQy31XBYkK2oGUuV1qJOrr3PHjrNotRkY5n
         tymc28VrThMfKCLjUgO5RLhhBB7B4lBxDxocN9uWqUHl1XD8zuWGY6LiyPBTRZBy0VOT
         MD4dIDbhqnFB60fhU6d/GTAit6szOsdk538ZpUzBpARGLFSZMSoY12cE9OxE9DwSk2yG
         ZpvDqZPyzAsxheUzQgnkiOMQCZ9I8bdzeM1psL3lIAtw8a+8ulJRuaAs3PwRQ/CgR3Bg
         1NkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxusxOrMsxBmAYiC10w09rfK55kqdHFQcKTZkVsYfJRWXr4G8lFx+BoYvLpDJWsJp64DL5w7SK0lLM=@vger.kernel.org
X-Gm-Message-State: AFuF++kTTZGN7Z2ZLttC1h0AnMx98EkM96izMe9ng6CMJ2mNSKvNysYG
	dvyOx2D2PGvRFBwIc6QCs4GkBhBaH9QSa4PFa8O6pMMzSTchmHk+n72i
X-Gm-Gg: AYBFou33XSyI1a7tF9KuJeXvu6is6EKSnYAcpGtkyYJUVGqYpaUFn24ZXgb6MjUM6q4
	PN0j2mXLnptFJwiDwA4UbDP/DUDymEbZBeX+KyQceT9NZDlMO8IQhttCR25MTxiGB/Pecvby7jc
	Fl3tIyrMgTzoqs40flY6N0njyaEHGZjOwFB+3y18X9VYT852sDcfrUAQvLAMAdeKL0ytgmRTjC9
	d3bO1JLDtlTrdY5wiDA/6SZ42S2QYIEf32SVSNw2Iy0KkmUhtfToroNRxruQfaNMIeIwzJMDsiO
	X/evqPHTqnpvwQuDLgnWkRNqlAhpriTzGbkHEDiiBwjl1+7LffeByeYbp+OQIdq1wLcq15exR65
	G9LfhcwbcohuX9oJxMK/U2jhSjuuTJaLuImeBfyQzNprW+PSCspgYqZVo66M10zVg95Lz3l1DMO
	5/T5GVqKo05HwZ9SAIVeVNUl9VAMNXjdIgYXSxdbfNLsGOxmqLI/eX40besq0x+VHNcbWLObet5
	HTusc6PkIExd0ddYQnu6MevELYLioJvNUvV7llPJLpowESvX89CswaUuamKybdgPR/NXHkcA755
	YsQoVLS2MQ==
X-Received: by 2002:a05:600c:474a:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49cf823f60amr335765905e9.11.1788982646565;
        Wed, 09 Sep 2026 12:37:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/3] soc: renesas: rz-sysc: Configure AOF registers from dma-ranges
Date: Wed,  9 Sep 2026 20:36:37 +0100
Message-ID: <20260909193640.8069-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Some RZ SoCs contain bus masters that can only generate 32-bit addresses
but need to access memory located above the 4 GiB boundary. The System
Controller (SYSC) provides Address Offset Function (AOF) registers that
translate the upper address bits on a per-master basis to extend the
accessible physical address range.

Each such master only ever places bits [29:0] of its own address
directly onto the interconnect. Bits [31:30] of that same 32-bit
address are not used as address bits at all -- instead they select
one of four 6-bit fields (Reg0-Reg3) in the master's SYS_AOFn
register. The selected field supplies the corresponding bits [34:30]
or [35:30] of the actual bus transaction, effectively splitting the
master's native 4 GiB address space into four independently
relocatable 1 GiB windows and letting each be redirected anywhere in
a 35-bit (masters limited to DDR0/DDR1 access) or 36-bit (masters
that can also reach PCIe0/PCIe1) physical address space.

Add generic infrastructure to configure the AOF registers from the
firmware-provided dma-ranges property instead of relying on hardcoded
register programming. Each supported bus master is described by its MMIO
base address, corresponding SYS_AOF register index, and address width.
At probe time, the driver matches the bus master against this
description -- via the addressable child node of a devicetree
"simple-bus" wrapper carrying dma-ranges -- and programs the appropriate
AOF register by decomposing each dma-ranges entry into the 1 GiB-aligned
segments it maps to, translating the child (device-side) address into
the field it selects and the parent (physical) address into the value
written to that field.

Validate the dma-ranges entries before programming the hardware by
checking 1 GiB alignment on both the child and parent addresses,
ensuring the described child range does not exceed the master's own
4 GiB address space (i.e. does not require more than the four available
1 GiB translation windows), and verifying that the requested physical
target is representable within the bus master's address width.

Populate the AOF description table for the RZ/V2H SDHI controllers,
which use SYS_AOF16-18.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g057-sys.c |   9 +++
 drivers/soc/renesas/rz-sysc.c       | 118 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h       |  22 ++++++
 3 files changed, 149 insertions(+)

diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 308492c31acb..960fcba668b3 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -82,6 +82,12 @@ static void rzv2h_sys_print_id(struct device *dev,
 		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
 }
 
+static const struct rz_aof_unit rzv2h_aof_units[] = {
+	{ .base = 0x15c00000, .index = 16, .addr_bits = 35 }, /* SDHI0 -> SYS_AOF16 */
+	{ .base = 0x15c10000, .index = 17, .addr_bits = 35 }, /* SDHI1 -> SYS_AOF17 */
+	{ .base = 0x15c20000, .index = 18, .addr_bits = 35 }, /* SDHI2 -> SYS_AOF18 */
+};
+
 static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initconst = {
 	.family = "RZ/V2H",
 	.id = 0x847a447,
@@ -89,6 +95,9 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.print_id = rzv2h_sys_print_id,
+	.aof_units = rzv2h_aof_units,
+	.num_aof_units = ARRAY_SIZE(rzv2h_aof_units),
+	.aof_base = 0x0500,
 };
 
 static bool rzv2h_regmap_readable_writeable_reg(unsigned int reg)
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 0e92c415d4be..2dae4a0de99b 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -28,6 +29,121 @@ struct rz_sysc {
 	struct device *dev;
 };
 
+static const struct rz_aof_unit *
+rz_aof_lookup(const struct rz_sysc_soc_id_init_data *soc_data, u32 base)
+{
+	unsigned int i;
+
+	for (i = 0; i < soc_data->num_aof_units; i++)
+		if (soc_data->aof_units[i].base == base)
+			return &soc_data->aof_units[i];
+
+	return NULL;
+}
+
+static int rz_aof_parse_bus(struct rz_sysc *sysc,
+			    const struct rz_sysc_soc_id_init_data *soc_data,
+			    struct device_node *bus_np)
+{
+	const struct rz_aof_unit *unit;
+	struct device_node *child;
+	struct resource res;
+	const __be32 *ranges;
+	int naddr, nsize, cell_sz, len, nentries, i;
+	u32 reg_val = 0;
+
+	child = NULL;
+	for_each_child_of_node(bus_np, child) {
+		if (of_address_to_resource(child, 0, &res) == 0)
+			break;
+	}
+	if (!child) {
+		dev_warn(sysc->dev, "%pOF: no addressable child found\n", bus_np);
+		return -EINVAL;
+	}
+
+	if (!of_device_is_available(child)) {
+		dev_dbg(sysc->dev, "%pOF: %pOF is disabled, skipping AOF setup\n",
+			bus_np, child);
+		of_node_put(child);
+		return 0;
+	}
+
+	unit = rz_aof_lookup(soc_data, (u32)res.start);
+	of_node_put(child);
+	if (!unit) {
+		dev_warn(sysc->dev, "%pOF: no AOF unit for base %pa\n", bus_np, &res.start);
+		return -ENODEV;
+	}
+
+	naddr = of_n_addr_cells(bus_np);
+	nsize = of_n_size_cells(bus_np);
+	cell_sz = (naddr * 2 + nsize) * sizeof(u32);
+
+	ranges = of_get_property(bus_np, "dma-ranges", &len);
+	if (!ranges || !cell_sz || len % cell_sz) {
+		dev_err(sysc->dev, "%pOF: malformed dma-ranges\n", bus_np);
+		return -EINVAL;
+	}
+	nentries = len / cell_sz;
+
+	for (i = 0; i < nentries; i++) {
+		const __be32 *p = ranges + i * (naddr * 2 + nsize);
+		u64 child_addr = of_read_number(p, naddr);
+		u64 parent_addr = of_read_number(p + naddr, naddr);
+		u64 size = of_read_number(p + 2 * naddr, nsize);
+		unsigned int nseg = DIV_ROUND_UP_ULL(size, SZ_1G);
+		unsigned int sel0 = (child_addr >> 30) & 0x3;
+		u64 tgt0 = parent_addr >> 30;
+		unsigned int s;
+
+		if (child_addr & (SZ_1G - 1) || parent_addr & (SZ_1G - 1)) {
+			dev_err(sysc->dev, "%pOF: entry %d not 1GiB aligned\n", bus_np, i);
+			return -EINVAL;
+		}
+
+		for (s = 0; s < nseg; s++) {
+			unsigned int sel = sel0 + s;
+			u64 tgt = tgt0 + s;
+
+			if (sel > 3) {
+				dev_err(sysc->dev, "%pOF: entry %d overflows the 4 fields\n",
+					bus_np, i);
+				return -EINVAL;
+			}
+			if (unit->addr_bits == 35 && (tgt & BIT(5))) {
+				dev_err(sysc->dev,
+					"%pOF: target 0x%llx needs bit[5], unit is 35-bit only\n",
+					bus_np, tgt << 30);
+				return -EINVAL;
+			}
+			reg_val &= ~(0x3fu << (sel * 8));
+			reg_val |= (tgt & 0x3f) << (sel * 8);
+		}
+	}
+
+	writel(reg_val, sysc->base + SYS_AOF_OFFSET(soc_data->aof_base, unit->index));
+
+	return 0;
+}
+
+static void rz_sysc_setup_aof(struct rz_sysc *sysc,
+			      const struct rz_sysc_soc_id_init_data *soc_data)
+{
+	struct device_node *np;
+
+	if (!soc_data->aof_units || !soc_data->num_aof_units)
+		return;
+
+	for_each_node_with_property(np, "dma-ranges") {
+		if (!of_device_is_compatible(np, "simple-bus"))
+			continue;
+
+		if (rz_aof_parse_bus(sysc, soc_data, np))
+			dev_warn(sysc->dev, "AOF setup failed for %pOF\n", np);
+	}
+}
+
 static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *match)
 {
 	const struct rz_sysc_init_data *sysc_data = match->data;
@@ -137,6 +253,8 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	rz_sysc_setup_aof(sysc, data->soc_id_init_data);
+
 	regmap_cfg->name = "rz_sysc_regs";
 	regmap_cfg->reg_bits = 32;
 	regmap_cfg->reg_stride = 4;
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index e55f3258d703..481d5d5a0577 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -12,6 +12,18 @@
 #include <linux/sys_soc.h>
 #include <linux/types.h>
 
+/**
+ * struct rz_aof_unit - RZ AOF unit description
+ * @base: MMIO base of the master IP (low 32 bits; all < 4G)
+ * @index: index of SYS_AOFn (0-based)
+ * @addr_bits: address width of the master IP (35 or 36 bits)
+ */
+struct rz_aof_unit {
+	u32 base;
+	u8 index;
+	u8 addr_bits;
+};
+
 /**
  * struct rz_syc_soc_id_init_data - RZ SYSC SoC identification initialization data
  * @family: RZ SoC family
@@ -21,6 +33,10 @@
  * @specific_id_mask: SYSC SoC ID specific ID mask
  * @print_id: print SoC-specific extended device identification
  * @pwrrdy_pwrseq: has pwrrdy register controlled through power sequencer
+ * @aof_units: array of AOF units for this SoC, or NULL if it has none
+ * @num_aof_units: number of entries in @aof_units
+ * @aof_base: offset of SYS_AOF0 from the SYSC base; ignored if @aof_units is NULL
+ *            (this offset is SoC-specific, unlike the fixed inter-register stride)
  */
 struct rz_sysc_soc_id_init_data {
 	const char * const family;
@@ -31,8 +47,14 @@ struct rz_sysc_soc_id_init_data {
 	void (*print_id)(struct device *dev, void __iomem *sysc_base,
 			 struct soc_device_attribute *soc_dev_attr);
 	bool pwrrdy_pwrseq;
+	const struct rz_aof_unit *aof_units;
+	unsigned int num_aof_units;
+	u32 aof_base;
 };
 
+#define SYS_AOF_STRIDE			0x0004
+#define SYS_AOF_OFFSET(aof_base, n)	((aof_base) + ((n) * SYS_AOF_STRIDE))
+
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
-- 
2.55.0

