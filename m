Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550394C14E2;
	Tue, 15 Sep 2026 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493798; cv=none; b=smWeSHACaw1hn5OyMjnfHOg8htp5S1gt1V+pylBfl2oa5s4T2CF/d1BjbxFA14FFI/wv7pdJLCrxsc/Zn5aCDOIJu9ZlF0/ffBONn3Epxs1CO9MYEDirXY+c9DM09apP39UaPl9xXWWXYaxYvKlwee8IimRi+OVwmWr8v0cWkxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493798; c=relaxed/simple;
	bh=BB12eGStbY2cKVpJoVtGlbDso6wUiNYfsdr/15rIpmY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UGhGRiFg3KAqCvqLH9Q806Sn4xyfYWTlrBN5/YZxrOweUXoy0qIHcmBEJAxUapW0eSGrR3fUhpDq+qfvrDCvK1fN3dHY8DQrYe6SLW4wwJvVrQ2YUhaNa/jTBVcQFpi5J1Rjn8idCbig8nHu8jnncAnQurUlT56lKEdXUSaF5jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkMm58ze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkMm58ze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E091F00893;
	Tue, 15 Sep 2026 17:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493797;
	bh=OxZYM+VpkLS0sx0hjuecPxta3+zHycbz3PaIGEaDaaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MkMm58zeQrM65Xhqh8VJUnyMJaTaaOUHosSHb9fLUDAmnU1v34L4cioOVjKRtVHmf
	 aaR3TSVhWDeP12/D0ykczDHXeOkAD+zbVv9FSs6SjbHJcLESNNMY9zFS7M4znHsKBM
	 YUuVIhxZJDxI7QDVVe2ZAqDmrXMdRg0W7PyiK1Ahvm0BQzUru7HMj07INxfnloYid8
	 R3sRP5Enou8IFXYrGNGtOp/ArHdp1RAipYQfsFnHc1ccsiJYunpX8Tzt8nqIVDKywT
	 9BvsTbzGATFjeto2FngYCQgjVg18ZTYBYPRKKkIob0BNKaNdYxNb5dm5cN6Au81Z65
	 LJIJnjJ+KKlHw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Zhang Wei <zw@zh-kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911220439.177474-1-rosenp@gmail.com>
References: <20260911220439.177474-1-rosenp@gmail.com>
Subject: Re: [PATCHv3] dmaengine: fsldma: convert to
 platform_get_irq_optional()
Message-Id: <178949379485.248239.8580173639743489517.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:34 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 11 Sep 2026 15:04:39 -0700, Rosen Penev wrote:
> Replace the per-controller irq_of_parse_and_map() call with
> platform_get_irq_optional(). The controller IRQ is optional when absent
> and the driver falls back to per-channel IRQs. The corresponding
> irq_dispose_mapping() calls in the probe error path and remove function
> are removed.
> 
> Moved before anything else in order to handle -EPROBE_DEFER and to avoid
> doing extra work. Simplifies the if statements as well.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fsldma: convert to platform_get_irq_optional()
      commit: 0838d7cfa42536d2cdeb90074417fae33a2585a6

Best regards,
-- 
~Vinod


