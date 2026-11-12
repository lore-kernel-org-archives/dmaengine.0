Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486251;
	b=j6KGmiuh5YjFh5N9LUYrO79DM6NrOj4YgM5ASXj+RKKDrOtpwcKAxKTqbswG2SkXDLJK
	 SgI0ODG9Pwk/4WNySomAKfsj3ilVzZHmvOmJYcqpJGkItTtbiIEHrzLNk/fQ0fZO+axgs
	 fkLOohg5xn8tB3sd7nPqkjrRCcWqecbF/ukPTAkEXMkIhY5cZ1R1zAFzD3RR3vOeLqYIq
	 JS5kKmS2hYXyOVtxcsglgXoEkWofRlN0IV/ZIt1oTyRHJYcA34eiEMh6CCOWUKi3SVWtQ
	 tM2qywL5ZQ/b0FRznDke1zwhBLsxVW5nGbhq6abe7bMSQQ8b+aep2CTYXYcyFzQDtOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
	b=1cr/lrTShlsv6D7wt+87C86wjVteB9pIIt/V0V2690ugfTyGgrkidEXVwTN2y9xha8gv
	 /0aG3O5NxAHKBCeBLtLS89keK0v6YDwfs44Lr56iA6Rl0PqZl3To4SB0bM2f8ObFzVAXo
	 R2fdmWALNFdlsc4fzWHKH9NJyjcsDJE7g7ZlB2+5aGh/IATfR5KFjvHkiNzyq6M9i8nKa
	 LFt4IdE0jocyru+tBVKVYhXoN62REBoQOvRuWdQ4qgx7FcFlNUcA1odA7W6VP7onPGL2l
	 DO6eefEArM/ZMnQfybFo0AB/3vb8H7cGHLY4xbB9DZxn1wv3HYZYPmT/DU4aDPVCLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L23mmaik;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFFC606A33F
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 12:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFFC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L23mmaik
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso5009190a12.1
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486249; x=1795091049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
        b=L23mmaikCY+Jsd315IBXg/zTyoa42t+VmyZ8aMGiwsxXeY380o8Ap88X5Mqxl02op/
         bHe2uj8e5n02XfWkRCEhI9hln7bZO4WxZFqr09arcjJBJPde0vc82w9kXA2I3yzvuwtY
         s4A058wfU8lQtbpSfH9Nx3tZxRmY1tfIheJNflspNjHhCURoxKdqXL+Pt6P2OOTurmFS
         NEYQdyw33s9Qa6EmKiWsYojXpcW1LYz9Ea7gDHvnKG2tFKQwG/KmkFHC8JaXTb4FRfwK
         oatWn9QLLbwjn3AJDpx6X7WxREYDlaC8TiMm3heez2+AvSjmtEIS8pYMOelizS+fAVOL
         l82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486249; x=1795091049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
        b=nwQH/anhLs2S+ixBQ9+LxvwRnh4oxD0nPv0I+q/JnqeiSep5LXmAs1r1ktM5Hz3bPN
         C0yKeCMCq7cydk5Frz6DBi8jWM4OLlE+a7uPRFFIbVjTNLed6GAnotPm72Goynd5d10b
         OTEwfLvM8W9bvEj9u6zChNtalAvusopaf8wmYbDgfQF6qeHnTwCq07riCMrP5rW/+xeq
         XtvZrzQ5biPTZkyD/1E1AgY3H06nnltIFHKyr19YnbL1ycD95yFyNrPrP+5ma74y17fz
         4PR6F5RbpMhfgKv26nOSQ4Gnzm1zqizuqQFmz22LkvEmQuxS9lg4rVGv643ouT20WeZw
         2EGg==
X-Forwarded-Encrypted: i=1; AL+hErEjEe2VHrZ3O2Zm9reDgEYVcmZMelu+suKCMfvWdIipmGFl9JqzBwlxBUCNF3r1zD8qdF7g9370ucs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ASohuYB5VMgrSp3KIodwz/eiCS3fCnF1bkpRya/HoIhsZFl5e
	jdO30ejJ6z+JEIKFbQUhANoF6T4HoB7J5N074zX+dRfw7jAPO90cWY4M
X-Gm-Gg: AYBFou26wS9oqOEoOcCLHJKQrb172FRlW9VoQ+EFJQikfQ2txmWeSDnl2QxDFNMpcBj
	ALjlgm5tblVIlC7gc/SRFboa0kVBfWMCLWxcAp74w6fzPmGEQSUvtk0V6BR6DbprYyhFjP1Ile7
	Twh9s8TI5W2r1v8C+05ODhhulMIi3D0lW2VqwSNEY8/NhVLmrtRl1pY+bNG83uTLUCAKOCiLNps
	LUtBeZ9mOEUS2G/0paITrMqyafEUrttlr1GGH7LuDyaSVu1LPngihYeQ8c5ddXWoDXH2UBDB5zg
	JPq6zd5mp3vrPwcVJ7wXAWDrOsNbWjsmt9/VvalCVne56ji28em9l+eyAuW5c14If4yZgUbT5Az
	l+zcjdVpOkljZzWnOrALKIXQWUdr7nZDjHZnDWqvaFUU2edA+DIYpiSx/I+b4oVNpfCRfD2eDR3
	LmIBz2E7ePfSRF4hOyp2pPHSSfZJLmot9V9LKvvGR/yFhhFxpOwQs+Mz0LxNexeygHWox590PtD
	az5d//K0NgyHqvzJGcJ6N3gK93MDPJZtqLB+7hQ97kD6TXTbtXQeKydgI51hbW+DqXxjupjIGFa
	P0JBtQTOe+wgYq0PwKPRu37vPZnbBVZ/WF1JjUVA
X-Received: by 2002:aa7:df0e:0:b0:6b6:fed8:e3bb with SMTP id 4fb4d7f45d1cf-6b7773edf13mr3161861a12.13.1794486248604;
        Thu, 12 Nov 2026 04:24:08 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:07 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 14:23:22 +0200
Subject: [PATCH 1/2] dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sc7180-gpi-dma-v1-1-2a8eceb49563@gmail.com>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
In-Reply-To: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Document the device tree compatible for the SC7180 GPI DMA controller.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index dc7bdf7c4201..01766475d1b5 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -36,6 +36,7 @@ properties:
               - qcom,qdu1000-gpi-dma
               - qcom,sa8775p-gpi-dma
               - qcom,sar2130p-gpi-dma
+              - qcom,sc7180-gpi-dma
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma

-- 
2.56.1

