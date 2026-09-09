Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E03BFE42
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982653; cv=none; b=J6U2oUeH/lpPLjVsc479N+anfGUR60P1fVoV9pvB7KiJALh0cNk/BuCPndoV3rMLpyKMsXKQ7bIZkRidefzcSWllv3YSfkGavA6gz+NuK4xRS7S03UntZGV2Z6bUmh8srpj0eRKqIxQvO9CKsIu+dr4JPJywSCd9gMu9yoMjI7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982653; c=relaxed/simple;
	bh=RN+2l8Ry5cU7Y+SQkk4XBFHCoYkQHFINdSGrSv0wojQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSmj+T1bzK1+ja1+Xc5JITbU4Z+yhIHqmuK/PzlaF6x133uCuIRmGDyUzvF/prhWQBWZ+ITONx6oxc5aTZtoSaAzhVAqgCxPTsJFhDDEsh6HpFnWC68VsUX9Bvn9CQ4972g5A9eR5W5Q0y+RkQ6ifghohOX6sKvB0g3uKza+4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZAaKhWK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZAaKhWK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso76654725e9.0
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982648; x=1789587448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phDmBn0qMNYKxqReRuAEO8P3Gi0eFxNdFtNGKUME1DM=;
        b=KZAaKhWKHEzwGluEC1dehoXQWFWkKWawi1YLvku2Tj2PZReu8uzKVBiyzLGeflpHHN
         kJA6P3/z018/XqYnb/N1f6VIXdv4M8LUz4L0uBMHtJ1l8FGB7co7uCTgfvdwEdeSDT3P
         CTnrnFMXnDHTkT60nqY5PGfZDgGECr4cOu3LR6MAkRksh0LYbqouLLaoCeUH29G7xR50
         3KhpBRBU6gcQ+t8l+Qg0mZL4Zwi7lWkarRvg7b9eOfmLs5tcTStBP57O2MsxCc4gzCdB
         KOdCL5KMX/8hbaX1nB1keRBhGVA0DFOnHoMuqJV6XswmxBwl/nMGIQJ2bkhyLliEsePJ
         Oq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982648; x=1789587448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phDmBn0qMNYKxqReRuAEO8P3Gi0eFxNdFtNGKUME1DM=;
        b=NeF9Z6R44xHN8iu6EB2Os3pn/Z+wzcdJJccxb44CBJ/xXoJjvC48LhWPaURTBijMz6
         4/zOVLkjVRVZCbyA9iUd31v+lh+qyNX9CMcn9MDpyeTdLoifz9NhqwIpiAc5pRedR8r2
         j9x+QOnWRvznsY/DCmGPdElRIAREurOqn7mxz9m6S0/R3Yp8OCwK38zNZ0RYH8OmzqCE
         fQy8AL0XjhTV7fdzEbnZ/buykVcXhQgyG4KfWpKWi6vwq2rpcwC8UGm5cUgQJGU0IPJb
         JrJ6HyZnpy6Zpr6AnzIiaJaJYl4MB0lXGuiChQaO4lBz2GVFkD9L7khaLluufWBK4z5m
         NisQ==
X-Forwarded-Encrypted: i=1; AKwUvByS1sqeetDkBFLlJsmGsuuHp7uo40WUX5PdSFZxoLazobNvGRs6C8DA2FUKUeCsldD8OTKvSLd55Vs=@vger.kernel.org
X-Gm-Message-State: AFuF++mx89aqsyKhNtc7bXcmiv/xmXsUzZwRMCpU0DC2IZoLuZC80gLQ
	n/U1okHybjwDtW1rBqy/ZR4wS9R8I56EKmchJjz7pcrl0dvpIOolIcEP
X-Gm-Gg: AYBFou3/dNPOfuqV2SLn8Sj5XPwFTx+tM/vTEguqkTjGNoD1T8AgQ9cw1C+m2CJx4Fh
	zWchcJpJv5wfu224CCtvKgodNcV7rFHrol49ixK+j/RwqilOUtkUuIhqCITTOArULee3Ex9/OGy
	4BMqBz0ejraZzVR5Ja10L/1EBMjewUdyeljIOgTJ5lwlPC3ExFFEygrIuHL0nMHNjzzX9YF056k
	gW+F4NZIr8QkbRFwwUJ+FsVT4gxKCaT3si4PspXzJkbFDUXfnzXBinub019ZkL/CeXGYujF59yu
	SEBn009TfZamaOiX+G/ggZW/4aSM3rJSiBuDrPNDsqgbPAQM3qOifvm05PD9C4rvDDSODY6aHX2
	FVo8gzTpc3iuizVCdgwt5WBvTsESfHPYuhfYDfnTVVRNc0QMUcWyxarmk/gip4XbWPvbVeSMO99
	/kZweF21qJ1Gw40anFwTEC0Txu5AhsjO2+vBZehpTB+LEV+0SxPvgIq+b01CZTT8kEVxTCzJp+f
	eSGHTE40SKWKnqQsmbn/X2x7HkyTFjQoJbu05CaEa6HFxMeOJQ3VmcYypB8eZxejA3+a6XiE8pk
	peFLdykEAA==
X-Received: by 2002:a05:600c:6298:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49d17d4d6e7mr144087385e9.23.1788982647983;
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Move SDHI1 dma range from 8-12 GiB
Date: Wed,  9 Sep 2026 20:36:39 +0100
Message-ID: <20260909193640.8069-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Relocate SDHI1's AOF-remapped DMA window to physical 8-12 GiB
(0x2_0000_0000-0x2_ffff_ffff), by updating the dma-ranges entry on
aof_sdhi1_bus so that SDHI1's full 4 GiB device-side address space
(child base 0x0, size 4 GiB) is linearly remapped starting at parent
base 0x2_0000_0000.

Since SDHI1's DMA-visible addresses no longer correspond 1:1 to
ordinary system RAM, buffers handed to it must be guaranteed to
physically reside within this window. Add a restricted-dma-pool
reserved-memory region covering the same 8-12 GiB range and attach
it to sdhi1 via memory-region, so the kernel bounces SDHI1's DMA
buffers through this pool instead of allowing dma_alloc_coherent()/
dma_map_sg() to hand back arbitrary physical pages outside the range
the programmed SYS_AOF17 fields can actually reach.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0926ab891fa5..6845d576af42 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -99,6 +99,17 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sdhi1_aof_pool: sdhi1-aof-pool@200000000 {
+			compatible = "restricted-dma-pool";
+			reg = <0x2 0x00000000 0x0 0x08000000>;
+		};
+	};
+
 	vqmmc_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI1 VccQ";
@@ -130,6 +141,10 @@ y1: y1-clock {
 	};
 };
 
+&aof_sdhi1_bus {
+	dma-ranges = <0x0 0x00000000 0x2 0x00000000  0x1 0x00000000>;
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
@@ -542,6 +557,7 @@ &scif {
 };
 
 &sdhi1 {
+	memory-region = <&sdhi1_aof_pool>;
 	pinctrl-0 = <&sdhi1_pins>;
 	pinctrl-1 = <&sdhi1_pins>;
 	pinctrl-names = "default", "state_uhs";
-- 
2.55.0

