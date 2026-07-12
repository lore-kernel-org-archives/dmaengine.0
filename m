Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A9817C203;
	Sun, 12 Jul 2026 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870249; cv=none; b=IY7zPCWx4P6um1QeSK4ACxnpSEW/4HjW9G2xPurqwO0lhXx6PawPDb2RTnB1HgutBESG9nXIqFxE2QsN/oERWwBxnPyrFDxaIoMxls1YfIW5pHCswipzNfjzKoiUeXpQTT7qbZvkPEUaWgAwYGTwaY5l1UiQC4IhecBc30a+7gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870249; c=relaxed/simple;
	bh=G4ZqMb9r3kIvBJ4JrU+JG0YoOknNa77KmsWEFFm96uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDshgQZka+OV9hcyAsk55n1CUg5EkAAGVX1ScNQhpNgeFSBCDTorzcBgr8bb4XNpvIcVVAb5RHmP72mbHe9+Xkc4F8SKSlxnoT92Op4McIpcHu8Os0cphJeXRVpsqVVov7EV9sPLkRiKV8jWVQ/4cfTs2JqeCQDR+aB3xjqzH0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axN8YC9y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axN8YC9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4D41F000E9;
	Sun, 12 Jul 2026 15:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783870248;
	bh=GJY2xhBQh2sZgDXarHGHV3CCWYj/7QjlB0cEJBnPWZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=axN8YC9ymzQVwWrW0O9+9CoJFwlbJk0aGDAGS0dLmMxEMZ1KuBcdBFg0LdRDZGVqU
	 vP1uiJa/qfiH9N9gcQgAGlsvyQkReU/4fk0vH/lQO3ZjP2eWVAfwd8zLvXHSCd7YGp
	 nzI6Qt5/yneIL6qHEUkh7kZPGQqXjWp/+vG9wFt5UBpmtgo3z6dNNd2NHCAVGDHVoi
	 QflI929hn9SOYSljgxxKNkgUwkIqPppXf7N1jm/88ItwmPp+RzfSBYAmtEP9wGycPy
	 300R0w7BvCshAkXFgWtzSayYvrp8oq5w50VxarCIET5CrpCm98rbFC+SBHS1VUENR4
	 EJVewBCQEWU/w==
Date: Sun, 12 Jul 2026 17:30:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
Message-ID: <20260712-delectable-nifty-smilodon-f2fed5@quoll>
References: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>

On Wed, Jul 08, 2026 at 12:35:38PM +0530, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

