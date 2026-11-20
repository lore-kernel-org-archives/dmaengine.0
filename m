Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168856;
	b=wNjvFl6O2gtpaJv8V5SnzO4BlwDrt1eVuOjT1Er7v36zbb1fUnlZsK1bDEohF1PRKwcl
	 3Mjh8Xuq0jxPYQ1a9qTmymZsBHmJ9qQX7HqSn2qCL1SZkYusfPlDJv1H9Ot0e995FXUlo
	 svAXm701/ax+uc9In09/8XobTZGLWe0Mkg0lNcf1sF2wSkdQw8pUtfSDrIXy5ruLXqyZS
	 ESuewkrXp48Q4iaXduvzcERDnf4VBdKjxVp76+kCeg8sabOsvpCnfBIwRh9H1jdQZT+Y2
	 vdzDsKBeS4eTU+UV2Bpsyv6SNIBNYOLu1KnadyOfAmt1Dt0VaIkxHy3kpdvL/JUxhNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168856;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=I6smobUPv3cyJYPgn3qcedpe3N8SjHJMR7oY8uoP1Uc=;
	b=E0JlxIAfCo91LgdN5hYQ6Nel6oDfm7GhL05hmrhS80zxrk315Jt1bHxE6CfkN1ZhY0ye
	 NKlpUpi8IInVLKm521cZOuMjWqvasUFEPNWhxZEwOo+3yqmSZbdnGowExYb/y/J0bW/F0
	 7UKvJAiDTuCIDiYmtYU5JQVu4Fiont7lf2qxs10kOj8HVzXMpI2Tl0iYj52Vmv+YF3zDW
	 fcTHVNPSd9+B29jae6624nTVnJWEwFNlCEx6J2jEJCliW9vV548VjaXFN42G3XuEkcm6R
	 6JBPzvj15sPR34TC1uGwm28vhTafU9CxwjuI/pqiNGehjrIwJKJnZn/9rYqYorBIOjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bwtocjf7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A308606A331;
	Fri, 20 Nov 2026 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bwtocjf7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF391F000C4;
	Fri, 20 Nov 2026 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168856;
	bh=I6smobUPv3cyJYPgn3qcedpe3N8SjHJMR7oY8uoP1Uc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Bwtocjf7ODn/JWV/ARLlgVgd+2vZrPjK3Du1zJi9TAMnQmEhg8h+zEbbGRnNPR2KV
	 LnBdGdKs01NQ+0SVmm3nfzccXRYLUw5bAIoph49ahD5l9akM7cDaidEesac3V80Gpg
	 bHLxLrVKVqL463VPay5RWUgktV5YFg3dwCR0QXSSdM1cA+cwMIwU/q/+7+yfXHmx3L
	 ppBLjc7mNUjaKi06lvt2nkWvKuNxhec8I0W40IE0s4HLPbeWObEXRo+3sy9v1zUVkQ
	 JaFl4H3CmDqKtCSlx4XnfxgC1DmVG0ONaUgsLMZukmVcg8IQF4omQb4cZya7X2wmDF
	 7leJGcnu8DsVw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, 
 Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Cc: Frank.Li@kernel.org, andi.shyti@kernel.org, 
 mukesh.savaliya@oss.qualcomm.com, naresh.maramaina@oss.qualcomm.com, 
 aniket.randive@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909175332.304767-1-sevanevorotov29@gmail.com>
References: <20260909175332.304767-1-sevanevorotov29@gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: gpi: Set IEOB on linked I2C GO TRE to
 retire TX descriptor
Message-Id: <179516885342.45276.11575602178532615252.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:30:53 +0530
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
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 00:53:32 +0700, Vsevolod Nevorotov wrote:
> In GPI mode, an I2C read transaction consists of a command phase on the
> TX channel (issuing CONFIG0 and GO TREs) linked to a data phase on the RX
> channel (issuing the DMA TRE to receive data).
> 
> Commit 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single
> read message in GPI mode") avoided programming a dummy TX DMA TRE for read
> messages, leaving only the GO TRE on the TX channel with the TRE_FLAGS_LINK
> flag set.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: qcom: gpi: Set IEOB on linked I2C GO TRE to retire TX descriptor
      commit: f7d9c8c1bd779dadb8ea5e6225a5ed2c301abdb2

Best regards,
-- 
~Vinod


