Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906185;
	b=ZV35GQKSj1aNUPewVTkIauXDThMV5sCOOVy9Hu02PnrJRu+17uT7JtmTsxjwH5eZ0qCR
	 eXHH57B/QUF4lkhDe00EMOvlkvV8uo/kju8qIFru/eh5g3MsgzyV5pMQKNQLKPgpiuWkT
	 l1AMar3zR7aRpeUMvm1yKvOKxcIx9llC1xygLPsApskgLvJXzn4IHfMYYUJjOqlYUBkMn
	 59VbElbxl1abZlP+c6H+yLe4Ja/5Bly/k/GKELg4y9Ap6KUsSbgECOiTfSoBOlYwHx3ZI
	 u1++C8UykIEROY6IC+DEtNwugr+GVGVbngrUhAgVa3t2kgMFDNLbva8hIWJXd4z4xdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
	b=mfkizSq+S8mv5AjqYYeEztVE741yCIOm10F2OdyAILldSjIiXqAigrYAw3ceasfKOONO
	 ioxnh7iJv1sQCTiGJLYUAsw9s3dn1ML44t/MsdifBQTz2oX7SHYO39NDlUIkMt5cQ9Uao
	 IpaLIRYNKAcINwrsLrNCq2oBP6YdBJ6aXbKViTf5kiVXtcC0CTUPVN4/Ts9N/R5JXKege
	 SJNX++YNdM132ikKEaqwIWDmvvX2ynkSvOanwMq/SC95GIF7zkZ+MQjQzbI+8lS1v0Z+I
	 BENSchNXqXO1rbpVeEr54c+xR+lWMd1UGt00a3z9jY6j6PhDGQBWHhERRw2pdtOKAFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P02okCnL;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683C0606A329
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 09:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683C0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P02okCnL
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1975456b3a.3
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906185; x=1795510985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
        b=P02okCnLOX7GQFg/FdyY1inxehwiUGMREuCWwjos/1ThOA4/pD0rqRQNGvoKrmJBLi
         jrPE7mYXfKmBLqYxDEzlMN1iQMhpO4rwtnClO63o6PidRV6Q1UDy3qAQQet+KE5ddlU6
         GhMPJ57s47bvZ3aty0Os6yO50Sacp7WmosuzBY8Yv7t5hLtXVX2gJrio3Ya6i2aluIyD
         5hip/jBIn5QkgC3WesUImZ7jrwRLs3c4LK5lBH9plIYqZE0IqpOfDKX7BQSQ8bIX2xEK
         3QGA2uwm02LMchE9oMe8vExBqjODkAwFXg42qRk1OAl7RV8wd1gsbSz8qxi0HcWONXVk
         nPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906185; x=1795510985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
        b=Hlb9EA8GEzu56ueek5UdQLTy0/tQ7VX/nifmxTeGJtilp4Wb1U0+7qvB6zFVYRNFrj
         ieokNkZVcWC+HiHi4GQYDo2DcFSkmDUWkHo1a1T29YiGMOAlKP0dLc6xL6l3c8ldCmRE
         mm/CIC3en3OukxUcph8jmgzTSG6/x/lQcCTSQRB6E41baQoilp4fgNXWfQFD2YlTTjTk
         rIjXuUwwpESzeKoKT/091jRn1CkZHda82zdYlKnBw0epX7NQIuHL12FZiQJtGbYN4lDN
         3GymZFF5CDJT0PI3MTSQ+KWm0sYaCs/uiWDiOtyNeSDOadst1VtgqWTr2dZLxmsb3rRs
         iYLQ==
X-Forwarded-Encrypted: i=1; AL+hErEQjsuP69wmrKjHY0VpcKifPGd2V+RT9pseaIyaW/9T3ezM770WEW5M8HqaGULjsrv3PtTB7LJZ87g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m/fNhCijRdpj09I4X/0AvAvD7p+86FJD3sPbKQBSfE8zl0bV7
	AQOl7UKeYsmO6BdRr8SrfJbDg1tUch3kIVtBQdKeV6WiaJdXMdXC7sz0
X-Gm-Gg: AYBFou3LtFwSCyww9swzHFjDCiRvkQiUIUTRWcG0q/n4TuHz4GUVe+HYl9KRLKyOk6G
	fBa64hmGXyyqei3g8eHlqJ2X28OXr/LdJQKUQv7BwDiiYVjUNhdqOmRFl77Q7w/bCcKqc3RKixo
	fxR4dgLOXs7XIPMMzi3+YN6wnJ1QT4QtKOfEtURq1Vcnqro+gTmZ7HK0Y1HYLC65hmKTLKGRciI
	OQI7yDD2aRyY6JgD7n+ZSC7I2jQJLXggeab0yHdTIbVNleGO37ue66ZYlEmaesQ9zoroXmcKMLE
	uh7UIiMNCk4kGdV6HOwwRHWUiQlgIB8Jl0goo4Row6dWNAqlNPXXqyUpXHh7Nj/dxxV+Y2YnDsW
	04MNya8Xgm6J0A0cnR6iqyrS1FnwWfvdPst6E5FV68mktiGEJeM5VgfTl7N601KvfYlNpa+8QIZ
	ez8oMQ5DCC29fXr+CEszwFdsa2aKq9bQuI/50IZ084fizPWds3EWoBSC3JU0sczb3b52LCD+1mO
	hfny9qqXedeAt4zIAiz7e7z47MXXNVfx4PQhfh1tIf8vC21dK5z00TItpmjW9iiMDBmJbpJEvr+
	f2ojf9WMZLDTv13wY7JEkA9+g+BxUQLFY4QQfAkiQ/0lZKbcTxdTIQS0eig1hHkw5CZOGht+4cU
	DsataFw==
X-Received: by 2002:a05:6a00:1c9c:b0:89d:5a80:5256 with SMTP id d2e1a72fcca58-8beb56cd05amr11614200b3a.9.1794906184648;
        Tue, 17 Nov 2026 01:03:04 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2a20fc8sm4517468b3a.49.2026.11.17.01.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:03:04 -0800 (PST)
Message-ID: <57e46e27-db98-4f9e-a657-1f224d3428b7@gmail.com>
Date: Tue, 17 Nov 2026 17:02:45 +0800
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Frank Li <Frank.li@oss.nxp.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
 <avtum_vwVClf7xhE@SMW015318>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <avtum_vwVClf7xhE@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank,

Thanks for your review.

Best Regards,
Shan-Chun

On 11/17/2026 4:59 AM, Frank Li wrote:
> On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> new file mode 100644
>> index 000000000000..d05971662a5d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 PDMA controller
>> +
>> +description:
>> +  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
>> +  has 10 channels and performs memory-to-memory, memory-to-peripheral and
>> +  peripheral-to-memory transfers.
>> +
>> +maintainers:
>> +  - Shan-Chun Hung <shanchun1218@gmail.com>
>> +
>> +allOf:
>> +  - $ref: dma-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-pdma
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#dma-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the PDMA channel number. The second cell is the
>> +      peripheral request source number, as listed in the reference manual.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#dma-cells"
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        dma-controller@40080000 {
>> +            compatible = "nuvoton,ma35d1-pdma";
>> +            reg = <0x0 0x40080000 0x0 0x2000>;
>> +            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk PDMA0_GATE>;
>> +            resets = <&sys MA35D1_RESET_PDMA0>;
>> +            #dma-cells = <2>;
>> +        };
>> +    };
>> +
>> +...
>> --
>> 2.25.1
>>

