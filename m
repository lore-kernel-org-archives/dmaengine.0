Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520351;
	b=so5zpiWx0CoVeMDMjLoG3nZhJdrSgOviLjYRvROE4OW5NPZ39oCiH9O+2wBOoPofSDVc
	 NTeba/+EAuEjBRejCySsiByOH3JqyFrtkS4h8ww/20ldNky7gR+TpjXjnIH5VlAlak77E
	 WYMtEwGPuqK09D49gwNj0vfabw2CFJtL6p+ejb6mnes6taRCZ7OsR5pof4AysZjWmHu2X
	 O/SIS+PiIJ8owfp28rHzsQ4xqLg+1+IkbaVtTG/kzSrUZoP0wMI5PS86jHKlJGLEnYsjg
	 4S7H4avcksC6Evv3BB9/uQXBcyZyFmAA/lRMiI4RdhM9+m0+3gSx/tSXeTv1jRB1rGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
	b=LAuaY3S3j23Y/lYmRO1eHdl1UbYIFtZBK9HUbk/u6jdaGzu0k3/roiIzEyD5FHelb4kv
	 1aWILX6/p++xrFBRsmcNZd98AeUCILIQWfJe8N7lMjVvlzuQAEzLjbJDUqDvnX2F1gyeo
	 eha7+uJy6pLT1Kz6+cMlcLNN5VJrsZpPufIgB+MAh4gVlPGCvKum8HgD+zsdBonz/HWk+
	 1xQONpn9PueVyZNEnNO6vcnvl4NlcNU9NFTSIo66Cq0nBzY/+EU1UwfC6I5IrjAzdkyzZ
	 eGHRg79VqoWhixlsxZjMv5LoPxQxAfgqLvPEpAkhdbkLW+QVoAVwca0TpiT0+RH+Owg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WiKU0hSh;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1820A60A2613
	for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 18:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1820A60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WiKU0hSh
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so28502145e9.3
        for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 11:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520349; x=1793125149; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
        b=WiKU0hShtPzBouD1dgArbwUjF8dfyPFYj/gHZUv58DhPJ5ioA4lOp2F7lGdDHPdx7R
         DtXiwKochHARG4iQ8ynqolKxNR/TbHnGz2zz7yHv7ZQXApZfgZsi7HAAFQTqh6a/3xYB
         +ktqG10VVZrCZWvLGfjhsYdCjR4pEPmrpDDWyn27qDhLxJv4ZPc9okFsaHDNxm4/wOIC
         6bOmF7C//FoQieu8wLCJ/qaMkcENgJfxxnTqh6Si8li3gKoXmEMygAWVaUEr/bKuwAp3
         Ij2iOS4vT5tCBsXvSrbgpPgl7qbFlWi9O2FVWd+/7Nk8BMkG2EZGzbv9ILKfrYjI0CSb
         SpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520349; x=1793125149;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
        b=Vu8HZ87qJbrSCS/dz8P+5c7DVLH5miXHscYthEoy9uR0LefLij27LtjsqLGUX72OnB
         yCRRPfCTZzE8x7sCtnJD65QLsHrHEfvV+LRzClbpkUFyu29m+88Yn/VbitIkkqbPTlL6
         wNC2g0j74BzvT0qjYCWCUPcB1TOxx7cYJLw05wsE7327QW6kd5uPaRv0hOli/uXiT0D9
         PTg0vz1HrQI9h5qZYsKS7lMV4fUht3qVAYWzJXWeCwM8w5tAp9AqHgWvZ/uxD+tjAmRD
         xQEdaDOMr0bbfys56Eb+1MQi10DutZuJglXKRx5the1cBLxh1O4gXSyrIrQJM0nciHMZ
         kIgg==
X-Forwarded-Encrypted: i=1; AKwUvBxxJg1J8ABf2X1SqwodB9Kuq3nuPHJrp7F6hhYYGDrXUmvc6mAwgvpnSEZ9yXuWPswnaj9tIs1KdgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYINJ5zJ2Fa9PvKh0oA0Lb+CTz/dsBOOdhj9Di1nY2TjzW20JMTw
	eyCwPFPvfvrhw22Q/VXYe43TlpXKVUFCNrMRfbEuRG38MrElgmgw1QZEs7AMz7So9/FTwyWmDwX
	mC295IOsA8WRXmw==
X-Received: from wrzq5.prod.google.com ([2002:a05:6000:1365:b0:48d:ed96:9428])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr249704165e9.0.1792520348399;
 Tue, 20 Oct 2026 11:19:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:08:01 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020180804.140766-1-smostafa@google.com>
Subject: [PATCH 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
to assing the QCE/BAM to VMs.

During unbind:
echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind

I see a system reset quite often, looking more into this,
that seems to be related to runtime PM, with those fixes I don't
see that anymore.

This patches apply on linux-next.

Mostafa Saleh (2):
  dmaengine: qcom: bam_dma: Take a PM ref at remove()
  dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()

 drivers/dma/qcom/bam_dma.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog

